# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.5"
RESTRICT_PYTHON_ABIS="2.4 3.*"

inherit jnrowe-pypi

DESCRIPTION="A Python wrapper for GitHub's Gist API"
HOMEPAGE="https://github.com/kennethreitz/gistapi.py"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-python/python-dateutil
	|| ( >=dev-lang/python-2.6 dev-python/simplejson )"
# RDEPEND needed at build time because the module is imported for metadata usage
# in setup.py
DEPEND="${RDEPEND}"

# tests span network boundaries, and depend on upstream availablility
RESTRICT="test"

DOCS="HISTORY.rst"

src_test() {
	testing() {
		"$(PYTHON)" ${PN}/${PN}.py || die "${PN}.py failed"
	}
	python_execute_function testing
}
