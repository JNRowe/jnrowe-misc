# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils toolchain-funcs

DESCRIPTION="POSIX function support library for lua"
HOMEPAGE="http://wiki.alpinelinux.org/wiki/Luaposix"
SRC_URI="mirror://github/${PN}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=">=dev-lang/lua-5.1
	virtual/pkgconfig"
RDEPEND="${DEPEND}
	dev-lua/LuaBitOp"

# Tests are broken, and have unpackaged dependencies
RESTRICT="test"

src_configure() {
	# Have to override datadir and libdir here as package doesn't
	# correctly use package dirs
	econf --libdir=$($(tc-getPKG_CONFIG) --variable=INSTALL_CMOD lua) \
		--datadir=$($(tc-getPKG_CONFIG) --variable=INSTALL_LMOD lua) \
		--docdir=/usr/share/doc/${PF}/html
}

src_install() {
	default
	einstalldocs
}
