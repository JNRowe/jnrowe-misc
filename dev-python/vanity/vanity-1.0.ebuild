# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted due to print syntax
RESTRICT_PYTHON_ABIS="3.*"
PYPI_ARCHIVE_SUFFIX="zip"

inherit jnrowe-pypi

DESCRIPTION="Easy access to PyPI download stats"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for entry points usage
RDEPEND="${DEPEND}
	dev-python/setuptools"

DOCS="docs/HISTORY.txt"
