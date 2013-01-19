# Copyright © 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit base toolchain-funcs

DESCRIPTION="TuDu is a comand line interface to manage hierarchical todos."
HOMEPAGE="http://code.meskio.net/${PN}/"
SRC_URI="${HOMEPAGE}${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="sys-libs/ncurses[unicode]"

DOCS=(AUTHORS ChangeLog README todo.xml)

PATCHES=("${FILESDIR}"/${P}-build_fixes.patch)

src_configure() {
	# Non-standard configure :/  Works with econf [currently]
	econf
}

src_compile() {
	emake CXX="$(tc-getCXX)"
}
