# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*:2.6"
# 2.{4,5} are restricted because of octal syntax
RESTRICT_PYTHON_ABIS="2.[45]"

inherit jnrowe-pypi

DESCRIPTION="Virtual Python 3 Environment builder"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for entrypoints usage
RDEPEND="${DEPEND}"

DOCS="docs/index.txt"
PYTHON_MODNAME="${PN}.py"
