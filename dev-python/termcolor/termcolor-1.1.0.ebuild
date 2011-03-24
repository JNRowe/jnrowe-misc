# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
# <2.6 is unsupported because of print function syntax, temporary fix
# would be to disable cprint for those versions if support is needed.
RESTRICT_PYTHON_ABIS="2.[45]"

inherit jnrowe-pypi

DESCRIPTION="ANSI colour formatting for terminals"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

PYTHON_MODNAME="${PN}.py"

DOCS="CHANGES.rst"
