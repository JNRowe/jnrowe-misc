# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
# 3.x is restricted due to exception handling syntax
PYTHON_COMPAT=(python2_{5..7})

inherit jnrowe-pypi

DESCRIPTION="A Scss compiler for Python"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for entry points
RDEPEND="${DEPEND}"

# Tests are currently broken, when they're re-enabled run with nosetests
# --with-doctest
RESTRICT="test"
