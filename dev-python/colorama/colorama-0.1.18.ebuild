# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2:2.5 3"
SUPPORT_PYTHON_ABIS="1"

inherit jnrowe-pypi

DESCRIPTION="Cross-platform colored terminal text"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT_PYTHON_ABIS="2.4"
