# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

PYPI_ARCHIVE_SUFFIX="zip"
inherit jnrowe-pypi

DESCRIPTION="Convert any Python module to a doctest ready doc string"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=""

RESTRICT_PYTHON_ABIS="3.*"
