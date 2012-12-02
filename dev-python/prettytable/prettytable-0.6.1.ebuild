# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2 python3_3"

inherit python-distutils-ng

DESCRIPTION="Display tabular data in a visually appealing ASCII table"
HOMEPAGE="http://code.google.com/p/${PN}/"
SRC_URI="mirror://pypi/P/PrettyTable/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS=(CHANGELOG)

python_test() {
	"${PYTHON}" ./setup.py test || die "Tests failed with ${PYTHON}"
}
