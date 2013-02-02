# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit toolchain-funcs

DESCRIPTION="Generate statistics from mbox and maildir folders"
HOMEPAGE="http://www.vanheusden.com/${PN}/"
SRC_URI="${HOMEPAGE}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	# Actually use the user's options.
	sed -i -e 's/-g//g' -e 's/-O2//' Makefile || die
}

src_compile() {
	emake CXX="$(tc-getCXX)" CC="$(tc-getCC)" || die
}

src_install() {
	dobin ${PN}
}
