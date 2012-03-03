# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="nosetests"

inherit jnrowe-pypi

DESCRIPTION="Painless Debugging and Inspection for Python"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND=""
RDEPEND="dev-python/colorama
	dev-python/decorator"

DOCS="HISTORY.rst ROADMAP.rst"

src_test() {
	testing() {
		nosetests-${PYTHON_ABI} ${PN}/tests/test_*.py || die "nosetests failed"
	}
	python_execute_function testing
}
