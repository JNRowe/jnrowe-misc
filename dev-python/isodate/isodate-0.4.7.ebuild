# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"
RESTRICT_PYTHON_ABIS=""
DISTUTILS_SRC_TEST="setup.py"

inherit jnrowe-pypi

DESCRIPTION="An ISO 8601 date/time/duration parser and formater"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# setuptools is an optional dependency for setup.py, but favour reproducibilty.
DEPEND="dev-python/setuptools"
RDEPEND=""

DOCS="CHANGES.txt TODO.txt"

# Tests are broken with <2.7 and 3.1, patch pushed
RESTRICT="test"
