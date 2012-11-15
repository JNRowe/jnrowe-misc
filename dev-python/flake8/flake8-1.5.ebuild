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

# tl;dr This package is masked on genesis, because it bundles libs
#
# Unfortunately, this package bundles slightly modified versions of pep8 and
# pyflakes.  Stripping the bundling and monkey patching in the changes will be
# a huge maintenance burden, so we'll try to live with it for the time being as
# this package never hits a deploy platform.

# setuptools is an optional dependency for setup.py, but favour reproducibilty
# as installation varies when it is available.
DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for entry points usage
RDEPEND=""

DOCS="CONTRIBUTORS.txt"
