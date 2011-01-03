# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit ruby git

EGIT_REPO_URI="git://github.com/defunkt/${PN}.git"

DESCRIPTION="hub is a command line utility which adds GitHub knowledge to git"
HOMEPAGE="https://github.com/defunkt/hub"
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

	dobin bin/${PN} || die "dobin failed"
	doman man/${PN}.1 || die "doman failed"

	cd lib
	insinto ${SITEDIR}
	doins ${PN}.rb || die "doins ${PN}.rb failed"
	insinto ${SITEDIR}/${PN}
	doins hub/*.rb || die "doins hub/*.rb failed"
	cd ..

	erubydoc
}
