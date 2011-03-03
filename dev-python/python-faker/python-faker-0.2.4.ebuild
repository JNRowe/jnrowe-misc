# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# Needs absolute import fixes
RESTRICT_PYTHON_ABIS="3.*"

inherit jnrowe-pypi

DESCRIPTION="Generate placeholder data"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=""

PYTHON_MODNAME="${PN##*-}"
