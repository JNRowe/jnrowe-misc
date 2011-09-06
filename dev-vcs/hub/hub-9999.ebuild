# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18"
EGIT_REPO_URI="git://github.com/defunkt/${PN}.git
	http://github.com/defunkt/${PN}.git"

inherit ruby-ng git-2

DESCRIPTION="hub is a command line utility which adds GitHub knowledge to git"
HOMEPAGE="https://github.com/defunkt/hub"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack() {
	git-2_src_unpack
	mv ${P} all || die "mv failed"
}

each_ruby_install() {
	local SITEDIR=$(${RUBY} -r rbconfig -e 'print Config::CONFIG["sitedir"]')

	cd lib
	insinto ${SITEDIR}
	doins ${PN}.rb
	insinto ${SITEDIR}/${PN}
	doins hub/*.rb
	cd ..
}

src_install() {
	cd all
	dobin bin/${PN}
	doman man/${PN}.1
	dodoc README.md

	ruby-ng_src_install
}