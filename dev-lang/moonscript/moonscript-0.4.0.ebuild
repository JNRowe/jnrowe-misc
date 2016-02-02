# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
GITHUB_USER=leafo
GITHUB_TAG=v${PV}

inherit jnrowe-github eutils toolchain-funcs

DESCRIPTION="A programmer friendly language that compiles to Lua"
# Really shouldn't do this, but it is a test only dep and this overlay is dead…
SRC_URI+="
	https://github.com/leafo/loadkit/raw/2954ab1/loadkit.lua -> loadkit-1.1.0.lua"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+inotify test"

RDEPEND=">=dev-lang/lua-5.1:=
	dev-lua/alt-getopt
	dev-lua/lpeg
	dev-lua/luafilesystem
	inotify? ( dev-lua/linotify )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	test? ( dev-lua/busted )"

DOCS=(CHANGELOG.md README.md docs/{api,command_line,reference,standard_lib}.md thoughts)

src_prepare() {
	ln -s ${DISTDIR}/loadkit-1.1.0.lua loadkit.lua

	sed 's,lua5.1,lua,' -i Makefile
}

src_compile() {
	emake compile
}

src_install() {
	einstalldocs

	dobin bin/moon bin/moonc

	insinto $($(tc-getPKG_CONFIG) --variable=INSTALL_LMOD lua)
	doins -r moon moon.lua ${PN}.lua ${PN}/
}
