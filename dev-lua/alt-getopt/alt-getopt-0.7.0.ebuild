# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils multilib

DESCRIPTION="Lua bindings to getopt_long"
HOMEPAGE="http://luaforge.net/projects/${PN}/"
SRC_URI="http://files.luaforge.net/releases/${PN}/${PN}/${P}/lua-${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-lang/lua-5.1"

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
	insinto /usr/$(get_libdir)/lua/5.1/
	doins ${PN/-/_}.lua

	einstalldocs
}
