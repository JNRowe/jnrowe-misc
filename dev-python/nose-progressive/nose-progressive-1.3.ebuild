# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted until blessings is available for 3.x
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="nosetests"
PYPI_OLD_DISTUTILS=1

inherit jnrowe-pypi

DESCRIPTION="Nose plugin to show progress bar and tracebacks during tests"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for entry points
RDEPEND="${DEPEND}
	dev-python/blessings
	dev-python/nose"

PYTHON_MODNAME="${PN/-/}"

src_test() {
	testing() {
		# Have to do this to make sure we pick up test in the 2to3 generated
		# tree for Python 3.x
		cd build-${PYTHON_ABI}/lib
		nosetests-${PYTHON_ABI} || die "nosetests failed"
	}
	python_execute_function testing
}
