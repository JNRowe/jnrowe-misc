# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
AUTOTOOLS_AUTO_DEPEND=no

inherit autotools eutils versionator

DESCRIPTION="WM agnostic tool to perform window tiling"
HOMEPAGE="https://launchpad.net/${PN}"
SRC_URI="http://launchpad.net/${PN}/$(get_version_component_range -2)/${PV}/+download/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="daemon"

# The gtkhotkey-0.2 dependency is enforced in the configure script, despite
# there being no later versions yet.
RDEPEND="daemon? ( =x11-libs/gtkhotkey-0.2* )
	x11-libs/libwnck"
DEPEND="${RDEPEND}
	!daemon? ( ${AUTOTOOLS_DEPEND} )
	dev-util/intltool
	virtual/pkgconfig"

src_prepare() {
	if ! use daemon; then
		epatch "${FILESDIR}"/${P}-no_gtkhotkey.patch
		eautoreconf
	fi
}

src_configure() {
	econf --disable-gtk-doc
}

src_install() {
	emake DESTDIR="${D}" winwranglerdocdir='${datadir}/doc/${P}' install \
		|| die "emake install failed."
	rm "${D}"/usr/share/doc/${P}/{COPYING,INSTALL}
}
