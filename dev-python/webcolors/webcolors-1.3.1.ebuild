# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"

inherit jnrowe-pypi

DESCRIPTION="Python library for working with colour names and HTML/CSS values"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

PYTHON_MODNAME="${PN}.py"
