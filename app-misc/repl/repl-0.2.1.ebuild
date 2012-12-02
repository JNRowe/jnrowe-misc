# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GITHUB_USER=defunkt
GITHUB_TAG=v${PV}

inherit jnrowe-github

DESCRIPTION="Sometimes you need a repl"
HOMEPAGE="http://defunkt.io/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="minimal"

DEPEND=""
RDEPEND="!minimal? ( app-misc/rlwrap )"

src_compile() {
	:
}

src_install() {
	dobin bin/${PN}
	doman man/${PN}.1
	dohtml man/${PN}.1.html
	dodoc README.md
}
