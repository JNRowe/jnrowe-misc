# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit git

EGIT_REPO_URI="git://github.com/defunkt/gist.git"

DESCRIPTION="Absolutely the best command line gister"
HOMEPAGE="http://github.com/defunkt/gist"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-lang/ruby"

src_install() {
	dobin ${PN}.rb
	dodoc README.markdown
}
