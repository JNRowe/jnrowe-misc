# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

# 3.x is restricted because of raise syntax
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit python-distutils-ng

DESCRIPTION="module to generate a formatted text table, using ASCII characters."
HOMEPAGE="http://foutaise.org/code/"
SRC_URI="http://foutaise.org/code/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""
