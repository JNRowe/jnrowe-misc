# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:"
# 2.4 is restricted due to relative imports and context handlers
# 2.5 is restricted due to context handlers(without __future__ import)
# 3.x is restricted due to octal syntax
RESTRICT_PYTHON_ABIS="2.[45] 3.*"

MY_PN="Stencil"

inherit jnrowe-pypi

DESCRIPTION="Creates files and directories from templates"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for entry points usage
RDEPEND="${DEPEND}
	|| ( dev-python/argparse >=dev-lang/python-2.7 )"

DOCS="HISTORY.rst"
