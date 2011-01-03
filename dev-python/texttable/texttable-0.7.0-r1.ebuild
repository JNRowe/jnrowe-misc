# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted because of raise syntax
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="module to generate a formatted text table, using ASCII characters."
HOMEPAGE="http://jefke.free.fr/coding/python/"
SRC_URI="http://jefke.free.fr/stuff/python/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

PYTHON_MODNAME="texttable.py"
