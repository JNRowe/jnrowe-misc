# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"

inherit jnrowe-pypi

DESCRIPTION="A Python wrapper for GitHub's Gist API"
HOMEPAGE="http://github.com/kennethreitz/gistapi.py"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

# tests span network boundaries, and depend on upstream availablility
RESTRICT="test"

DOCS="HISTORY.rst"

RESTRICT_PYTHON_ABIS="2.[45] 3.*"

src_test() {
	testing() {
		"$(PYTHON)" ${PN}/${PN}.py || die "${PN}.py failed"
	}
	python_execute_function testing
}
