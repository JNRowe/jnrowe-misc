# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

EGIT_REPO_URI="git://github.com/defunkt/gist.git
	http://github.com/defunkt/gist.git"

DESCRIPTION="Absolutely the best command line gister"
HOMEPAGE="https://github.com/defunkt/gist"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="dev-lang/ruby"

src_install() {
	dobin ${PN}
	dodoc README.markdown
	doman man/${PN}.1
}
