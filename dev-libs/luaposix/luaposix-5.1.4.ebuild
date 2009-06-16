# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit multilib toolchain-funcs

DESCRIPTION="POSIX function support library for lua"
HOMEPAGE="http://luaforge.net/projects/luaposix/"
SRC_URI="http://luaforge.net/frs/download.php/3572/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=">=dev-lang/lua-5.1"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}; cd "${S}"
	sed -i -e 's,/usr/local,/usr,' \
		-e "s,/lib,/$(get_libdir)," \
		Makefile
	# Broken test, rmdir code is still exercised
	sed -i '72s/^/--/' test.lua
	# Reset foreground colour after ENV display
	sed -i '47iprint("[33;0m")' test.lua
}

src_compile() {
	make CC=$(tc-getCC)
}

src_install() {
	emake PREFIX="${D}usr" install || die
	dodoc ChangeLog README
	docinto examples
	dodoc tree.lua
}
