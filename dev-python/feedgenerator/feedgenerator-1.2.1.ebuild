# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted because of old-style exception syntax
RESTRICT_PYTHON_ABIS="3.*"

inherit jnrowe-pypi

DESCRIPTION="Standalone version of django.utils.feedgenerator"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

PYTHON_MODNAME="${PN}.py"
