# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit base eutils toolchain-funcs

DESCRIPTION="Creates symlinks from one directory hierarchy to another(like stow)"
HOMEPAGE="http://www.rpcurnow.force9.co.uk/spill/"
SRC_URI="${HOMEPAGE}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS=(NEWS)

src_prepare() {
	epatch "${FILESDIR}"/${P}-build_fixes.patch
}

src_configure() {
	CC="$(tc-getCC)" econf
}
