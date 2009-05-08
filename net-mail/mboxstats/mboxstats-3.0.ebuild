# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs

DESCRIPTION="Generate statistics from mbox and maildir folders"
HOMEPAGE="http://www.vanheusden.com/mboxstats/"
SRC_URI="${HOMEPAGE}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack() {
	unpack ${A}; cd "${S}"
	# Actually use the user's options.
	sed -i -e 's/-g//g' -e 's/-O2//' Makefile || die
}

src_compile() {
	emake CXX=$(tc-getCXX) CC=$(tc-getCC) || die
}

src_install() {
	dobin ${PN}
}
