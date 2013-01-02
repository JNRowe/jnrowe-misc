# Copyright © 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit toolchain-funcs

DESCRIPTION="A simple content sensitive command launcher"
HOMEPAGE="http://offog.org/code/"
SRC_URI="http://offog.org/files/${P}.tar.gz"

LICENSE="GPL-2+"
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
