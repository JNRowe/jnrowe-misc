# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.6"
# 2.4 is restricted due to context managers
# 2.5 is restricted due to context managers without __future__ import
# 3.x is restricted due to Unicode handling
RESTRICT_PYTHON_ABIS="2.[45] 3.*"
EGIT_REPO_URI="git://github.com/mitsuhiko/${PN}.git"
EGIT_BRANCH="master"

inherit git distutils eutils

DESCRIPTION="Static site generator using reST for input"
HOMEPAGE="https://github.com/mitsuhiko/${PN}"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="dev-python/Babel
	dev-python/blinker
	dev-python/pyyaml
	dev-python/werkzeug"

src_prepare() {
	distutils_src_prepare

	epatch "${FILESDIR}"/${P}-install_templates.patch
}
