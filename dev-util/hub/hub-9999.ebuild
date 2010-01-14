# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit ruby git

EGIT_REPO_URI="git://github.com/defunkt/${PN}.git"

DESCRIPTION="hub is a command line utility which adds GitHub knowledge to git"
HOMEPAGE="http://github.com/defunkt/hub"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND=""

USE_RUBY="ruby18"

src_install() {
	local SITEDIR=$(${RUBY} -r rbconfig -e 'print Config::CONFIG["sitedir"]')

	dobin bin/${PN}
	doman man/${PN}.1

	cd lib
	insinto ${SITEDIR}
	doins ${PN}.rb
	insinto ${SITEDIR}/${PN}
	doins hub/*.rb
	cd ..

	erubydoc
}
