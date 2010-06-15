# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit autotools base

DESCRIPTION="A Gtk+ Widget for Displaying OpenStreetMap tiles"
HOMEPAGE="http://nzjrs.github.com/osm-gps-map/"
SRC_URI="http://www.johnstowers.co.nz/files/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

RDEPEND="net-libs/libsoup
	x11-libs/cairo
	x11-libs/gtk+"
DEPEND="${RDEPEND}
	doc? ( dev-util/gtk-doc )
	dev-util/pkgconfig
	gnome-base/gnome-common"

src_prepare() {
	epatch "${FILESDIR}"/${P}-build_fixes.patch
	eautoreconf
}

src_configure() {
	# This should be default for econf really.
	econf --disable-silent-rules \
		$(use doc gtk-doc)
}
