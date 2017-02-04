# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit base toolchain-funcs

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

PATCHES=("${FILESDIR}"/${P}-build_fixes.patch)

src_compile() {
	emake CC="$(tc-getCC)" PKG_CONFIG="$(tc-getPKG_CONFIG)" \
		|| die "emake failed"
}
