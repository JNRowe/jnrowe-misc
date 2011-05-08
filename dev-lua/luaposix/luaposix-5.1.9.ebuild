# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit multilib toolchain-funcs

DESCRIPTION="POSIX function support library for lua"
HOMEPAGE="http://luaforge.net/projects/luaposix/"
SRC_URI="http://luaforge.net/frs/download.php/4808/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=">=dev-lang/lua-5.1"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_prepare() {
	sed -i -e 's,/usr/local,/usr,' \
		-e "s,/lib,/$(get_libdir)," \
		Makefile
	# Broken test, rmdir code is still exercised
	sed -i '72s/^/--/' test.lua
	# Reset foreground colour after ENV display
	sed -i '47iprint("[33;0m")' test.lua
}

src_compile() {
	# Fails with emake, patch pushed.
	make CC=$(tc-getCC) || die "make failed"
}

src_install() {
	emake PREFIX="${D}usr" install || die "emake install failed"
	dodoc ChangeLog.old README || die "dodoc failed"
	docinto examples
	dodoc tree.lua || die "dodoc examples failed"
}
