# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit base

DESCRIPTION="SNG is a DSL to represent a PNG file in an editable form"
HOMEPAGE="http://www.catb.org/~esr/${PN}/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="ZLIB as-is"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="media-libs/libpng
	x11-apps/rgb"
RDEPEND="${RDEPEND}"

PATCHES=("${FILESDIR}"/${PN}-1.0.2-libpng_1_4_fix.patch)

DOCS=(AUTHORS NEWS README TODO)

src_configure() {
	econf --with-rgbtxt=/usr/share/X11/rgb.txt
}
