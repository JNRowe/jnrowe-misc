# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit multilib toolchain-funcs

DESCRIPTION="Comprehensive networking support library for the Lua language"
HOMEPAGE="http://www.tecgraf.puc-rio.br/~diego/professional/luasocket/"
SRC_URI="http://luaforge.net/frs/download.php/2664/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug examples"

DEPEND=">=dev-lang/lua-5.1[deprecated]"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e 's,/usr/local,${D}/usr,g' \
		-e "s,/lib,/$(get_libdir),g" \
		-e "s|gcc|$(tc-getCC)|" \
		-e "s,-O2,${CFLAGS}," \
		-e "s!-fpic!& ${LDFLAGS}!" \
		config
	use debug || sed -i -e '/^DEF=-DLUASOCKET_DEBUG/d' config
}

src_install() {
	emake install || die "make install failed"
	dodoc NEW README
	dohtml -r doc/
	if use examples; then
		doins -r samples
	fi
}
