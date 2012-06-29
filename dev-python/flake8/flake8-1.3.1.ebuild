# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*:2.6"
# 2.5 is restricted due to except...as syntax
RESTRICT_PYTHON_ABIS="2.5"
DISTUTILS_SRC_TEST="nosetests"
PYPI_OLD_DISTUTILS=1

inherit jnrowe-pypi

DESCRIPTION="Python code checking using pep8 and pyflakes"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# Unfortunately, this package bundles slightly modified versions of pep8 and
# pyflakes.  Stripping the bundling and monkey patching in the changes will be
# a huge maintenance burden, so we'll try to live with it for the time being.
#
# setuptools is an optional dependency for setup.py, but favour reproducibilty.
DEPEND="dev-python/setuptools"
RDEPEND=""

DOCS="CONTRIBUTORS.txt"
