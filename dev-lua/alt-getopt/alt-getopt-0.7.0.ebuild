# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils toolchain-funcs

DESCRIPTION="Lua bindings to getopt_long"
HOMEPAGE="http://luaforge.net/projects/${PN}/"
SRC_URI="http://files.luaforge.net/releases/${PN}/${PN}/${P}/lua-${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=dev-lang/lua-5.1"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}/lua-${P}"

DOCS=(ChangeLog README)

src_compile() {
	:
}

src_test() {
	# Quicker to run the tests directly then patch the Makefile for portability
	cd tests/
	ln -s ../${PN/-/_}.lua
	./test.sh || die "Tests failed"
}

src_install() {
	insinto $($(tc-getPKG_CONFIG) --variable=INSTALL_LMOD lua)
	doins ${PN/-/_}.lua

	einstalldocs
}
