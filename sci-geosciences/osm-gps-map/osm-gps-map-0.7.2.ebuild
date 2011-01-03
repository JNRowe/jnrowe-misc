# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="A Gtk+ Widget for Displaying OpenStreetMap tiles"
HOMEPAGE="http://nzjrs.github.com/osm-gps-map/"
SRC_URI="http://www.johnstowers.co.nz/files/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc +introspection"

RDEPEND="net-libs/libsoup
	x11-libs/cairo
	x11-libs/gtk+
	introspection? ( >=dev-libs/gobject-introspection-0.6.4 )"
DEPEND="${RDEPEND}
	doc? ( dev-util/gtk-doc )
	dev-util/pkgconfig
	gnome-base/gnome-common"

src_configure() {
	# Disable automake's silent rules should be default for econf really.
	econf --disable-silent-rules \
		$(use doc gtk-doc) \
		$(use_enable introspection)
}

src_install() {
	# This is simpler than mangling the Makefile for the broken doc path.
	emake DESTDIR="${D}" osm_gps_mapdocdir="/trash" install \
		|| die "make install failed"
	rm -rf "${D}"/trash
	dodoc AUTHORS ChangeLog NEWS README
}
