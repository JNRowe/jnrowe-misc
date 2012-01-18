# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.6"
# 2.4 is restricted due to conditional expressions
# 2.5 is restricted due to exception handling syntax
# 3.x is restricted due to exception handling syntax
RESTRICT_PYTHON_ABIS="2.[45] 3.*"
DISTUTILS_SRC_TEST="nosetests"

MY_PN="pyScss"

inherit jnrowe-pypi

DESCRIPTION="A Scss compiler for Python"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for entry points
RDEPEND="dev-python/setuptools"

# Tests are currently broken, when they're re-enabled run with nosetests
# --with-doctest
RESTRICT="test"

PYTHON_MODNAME="scss"

src_test() {
	testing() {
		nosetests-${PYTHON_ABI} --with-doctest ${PYTHON_MODNAME} \
			|| die "nosetests failed"
	}
	python_execute_function testing
}
