# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*:2.5"
# 2.4 is restricted because of conditional expressions
RESTRICT_PYTHON_ABIS="2.4"

inherit jnrowe-pypi

DESCRIPTION="A dead-simple Object-XML mapper for Python"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""
