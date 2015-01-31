# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
GITHUB_USER=leafo
GITHUB_TAG=v${PV}

inherit jnrowe-github eutils toolchain-funcs

DESCRIPTION="A programmer friendly language that compiles to Lua"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+inotify"

RDEPEND=">=dev-lang/lua-5.1
	dev-lua/alt-getopt
	dev-lua/lpeg
	dev-lua/luafilesystem
	inotify? ( dev-lua/linotify )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=(CHANGELOG.md README.md docs/{api,command_line,reference,standard_lib}.md thoughts)

# Tests are restricted because busted isn't packaged, and it brings in a *huge*
# stack of new packages.  The compile step will serve as moderately complete
# test for the time being.
RESTRICT="test"

src_compile() {
	emake compile
}

src_install() {
	einstalldocs

	dobin bin/moon bin/moonc

	insinto $($(tc-getPKG_CONFIG) --variable=INSTALL_LMOD lua)
	doins -r moon moon.lua ${PN}.lua ${PN}/
}