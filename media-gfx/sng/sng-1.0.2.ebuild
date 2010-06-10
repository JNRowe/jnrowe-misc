# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit base

DESCRIPTION="SNG is a DSL to represent a PNG file in an editable form"
HOMEPAGE="http://www.catb.org/~esr/${PN}/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="ZLIB as-is"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS=(AUTHORS ChangeLog NEWS README TODO)

src_prepare() {
	sed -i 's,^static png,png,' sngd.c
}

src_configure() {
	econf --with-rgbtxt=/usr/share/X11/rgb.txt
}
