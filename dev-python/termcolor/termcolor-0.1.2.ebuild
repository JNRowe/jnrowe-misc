# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

inherit jnrowe-pypi

DESCRIPTION="ANSI color formatting for terminals"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

PYTHON_MODNAME="${PN}.py"
RESTRICT_PYTHON_ABIS="3.*"

DOCS="AUTHORS.txt CHANGES.txt"
