# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x isn't supported because of print syntax
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Display tabular data in a visually appealing ASCII table"
HOMEPAGE="http://code.google.com/p/prettytable/"
SRC_URI="mirror://pypi/P/PrettyTable/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

PYTHON_MODNAME="${PN}.py"