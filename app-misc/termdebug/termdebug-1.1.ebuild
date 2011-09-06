# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit toolchain-funcs

DESCRIPTION="Utilities to record and replay a terminal program session"
HOMEPAGE="http://os.ghalkes.nl/termdebug.html"
SRC_URI="http://os.ghalkes.nl/dist/termdebug-1.1.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

PATCHES=("${FILESDIR}"/${P}-destdir_support.patch)

DOCS=(Changelog README)

src_prepare() {
	default

	# Handle docs install manually, for compression support.
	sed -i '/$(docdir)/d' Makefile.in
}

src_configure() {
	# Handmade configure :/
	CC="$(tc-getCC)" ./configure --prefix=/usr || die "configure failed"
}
