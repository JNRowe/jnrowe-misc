# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x isn't supported due to StringIO changes
RESTRICT_PYTHON_ABIS="3.*"

inherit jnrowe-pypi

DESCRIPTION="A simple Python package for easily generating Atom feeds"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""
