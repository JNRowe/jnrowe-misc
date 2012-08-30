# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted due to exception handling syntax
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="nosetests"
PYPI_OLD_DISTUTILS=1

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