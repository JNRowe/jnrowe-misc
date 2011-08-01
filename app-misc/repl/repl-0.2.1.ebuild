# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
GITHUB_USER=defunkt
GITHUB_TAG=v0.2.1

inherit jnrowe-github

DESCRIPTION="Sometimes you need a repl"
HOMEPAGE="http://defunkt.io/repl/"

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
	dobin bin/${PN} || die "dobin failed"
	doman man/${PN}.1 || die "doman failed"
	dohtml man/${PN}.1.html || die "dohtml failed"
	dodoc README.md || die "dodoc failed"
}
