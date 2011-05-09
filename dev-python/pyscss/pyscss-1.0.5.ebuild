# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.5"
# 2.4 is restricted due to conditional expressions
# 3.x is restricted due to exception syntax
RESTRICT_PYTHON_ABIS="2.4 3.*"
DISTUTILS_SRC_TEST="nosetests"

MY_PN="pyScss"

inherit base jnrowe-pypi

DESCRIPTION="A Scss compiler for Python"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for entry points
RDEPEND="dev-python/setuptools"

PATCHES=("${FILESDIR}"/${PN}-1.0.3-entry_point.patch)

PYTHON_MODNAME="scss.py"

# Tests are currently broken, when they're re-enabled run with nosetests
# --with-doctest
RESTRICT="test"

src_prepare() {
	base_src_prepare
	distutils_src_prepare
}

src_test() {
	testing() {
		nosetests-${PYTHON_ABI} --with-doctest ${PYTHON_MODNAME} \
			|| die "nosetests failed"
	}
	python_execute_function testing
}
