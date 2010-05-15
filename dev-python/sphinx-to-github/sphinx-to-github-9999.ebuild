# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils git

EGIT_REPO_URI="git://github.com/michaeljones/${PN}.git"

DESCRIPTION="Script to prepare Sphinx html output for github pages"
HOMEPAGE="http://github.com/michaeljones/sphinx-to-github"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/sphinx"

RESTRICT_PYTHON_ABIS="3.*"

src_test() {
	testing() {
		"$(PYTHON)" setup.py test
	}
	python_execute_function testing
}
