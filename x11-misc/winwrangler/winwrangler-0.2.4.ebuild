# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit versionator

DESCRIPTION="WM agnostic tool to perform window tiling"
HOMEPAGE="https://launchpad.net/winwrangler"
SRC_URI="http://launchpad.net/${PN}/$(get_version_component_range -2)/${PV}/+download/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

# The gtkhotkey-0.2 dependency is enforced in the configure script, despite
# there being no later versions yet.
RDEPEND="=x11-libs/gtkhotkey-0.2*
	x11-libs/libwnck"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig"

src_configure() {
	econf --disable-gtk-doc
}

src_install() {
	emake DESTDIR="${D}" winwranglerdocdir='${datadir}/doc/${P}' install \
		|| die "emake install failed."
	rm "${D}"/usr/share/doc/${P}/{COPYING,INSTALL}
	prepalldocs
}
