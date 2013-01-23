# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 3.x is restricted because of raise syntax
PYTHON_COMPAT=(python2_{5..7})

inherit distutils-r1

DESCRIPTION="Module to generate a formatted text table, using ASCII characters"
HOMEPAGE="http://foutaise.org/code/"
SRC_URI="http://foutaise.org/code/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""
