# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="A Gtk+ Widget for Displaying OpenStreetMap tiles"
HOMEPAGE="http://nzjrs.github.com/${PN}/"
SRC_URI="http://www.johnstowers.co.nz/files/${PN}/${P}.tar.gz"

# "or later" is scrubbed from standard header in src/
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

RDEPEND="net-libs/libsoup
	x11-libs/cairo
	x11-libs/gtk+:2"
DEPEND="${RDEPEND}
	doc? ( dev-util/gtk-doc )
	virtual/pkgconfig
	gnome-base/gnome-common"

src_configure() {
	# gobject introspection is broken in current release, and a fix will likely
	# break compatibility with future releases.
	econf --disable-introspection \
		$(use doc gtk-doc)
}

src_install() {
	# This is simpler than mangling the Makefile for the broken doc path.
	emake DESTDIR="${D}" osm_gps_mapdocdir="/trash" install \
		|| die "make install failed"
	rm -rf "${D}"/trash
	dodoc AUTHORS ChangeLog NEWS README
}
