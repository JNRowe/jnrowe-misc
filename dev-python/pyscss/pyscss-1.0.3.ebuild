# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.5"
# 2.4 is restricted due to conditional expressions
# 3.x is restricted due to exception syntax
RESTRICT_PYTHON_ABIS="2.4 3.*"
#DISTUTILS_SRC_TEST="nosetests"

MY_PN="pyScss"
MY_P=${MY_PN}-${PV}

inherit jnrowe-pypi

DESCRIPTION="A Scss compiler for Python"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=""

S="${WORKDIR}"/${MY_P}

PYTHON_MODNAME="scss.py"

# Tests are currently broken, when they're re-enabled run with nosetests --with-doctest
RESTRICT="test"