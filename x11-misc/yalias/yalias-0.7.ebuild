# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit toolchain-funcs

DESCRIPTION="A simple content sensitive command launcher"
HOMEPAGE="http://offog.org/code/"
SRC_URI="http://offog.org/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="x11-libs/gtk+:2"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=(NEWS README)

src_prepare() {
	sed -i -E -e 's,^(C|LD)FLAGS ,&+,' \
		-e 's,/usr/local,$(DESTDIR)/usr,' \
		Makefile
}

src_compile() {
	emake CC="$(tc-getCC)"
}
