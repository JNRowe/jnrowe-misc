# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.6"
# 2.4 isn't supported because of generators plus...
# 2.5 isn't supported because of context managers
RESTRICT_PYTHON_ABIS="2.[45] 3.*"

MY_PN="Logbook"
MY_P=${MY_PN}-${PV}

inherit jnrowe-pypi

DESCRIPTION="A logging module replacement for Python"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_P}
