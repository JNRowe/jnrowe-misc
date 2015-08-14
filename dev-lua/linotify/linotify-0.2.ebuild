# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
GITHUB_USER=hoelzro
GITHUB_TAG=${PV}

inherit jnrowe-github base toolchain-funcs

DESCRIPTION="A Lua binding for the Linux inotify library"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=dev-lang/lua-5.1:*"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

PATCHES=("${FILESDIR}"/${P}-user_flags.patch)

DOCS=(Changes README.md)

src_compile() {
	emake CC="$(tc-getCC)" PKG_CONFIG="$(tc-getPKG_CONFIG)" \
		|| die "emake failed"
}
