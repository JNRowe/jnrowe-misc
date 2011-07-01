# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.5"
# 2.4 is restricted due to conditional expression usage
# 3.x is restricted due to exec usage
RESTRICT_PYTHON_ABIS="2.4 3.*"

inherit jnrowe-pypi

DESCRIPTION="Spreadsheet directive for docutils and Sphinx."

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/docutils"

PYTHON_MODNAME="${PN/-//}.py"