# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit base eutils toolchain-funcs versionator

DESCRIPTION="TuDu is a comand line interface to manage hierarchical todos."
HOMEPAGE="http://www.cauterized.net/~meskio/tudu/"
SRC_URI="http://www.cauterized.net/~meskio/tudu/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="sys-libs/ncurses[unicode]"

DOCS=(AUTHORS ChangeLog README todo.xml)
src_prepare() {
	epatch "${FILESDIR}"/${P}-build_fixes.patch
	# The welcome file references the DTD, this fixes it
	sed -i 's,/local,,' data/welcome.xml
}

src_compile() {
	emake CXX="$(tc-getCXX)" || die "emake failed"
}
