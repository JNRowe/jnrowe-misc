# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"
DISTUTILS_SRC_TEST="nosetests"

inherit jnrowe-pypi

DESCRIPTION="Painless Debugging and Inspection for Python"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND=""
RDEPEND="dev-python/colorama
	dev-python/decorator"

DOCS="HISTORY.rst ROADMAP.rst"

src_test() {
	testing() {
		if [[ "${PYTHON_ABI}" == "2.4" ]]; then
			einfo "Skipping tests with Python v2.4, due to colorama dependency"
			return
		fi
		if [ "${PYTHON_ABI::1}" = 3 ]; then
			einfo "Skipping tests with Python v3, due to lack of nose support"
			return
		fi
		nosetests-${PYTHON_ABI} ${PN}/tests/test_*.py || die "nosetests failed"
	}
	python_execute_function testing
}
