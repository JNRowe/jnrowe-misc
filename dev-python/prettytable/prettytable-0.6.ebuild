# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

# No Python 3.1 because of html.escape usage
PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_2"

inherit python-distutils-ng

DESCRIPTION="Display tabular data in a visually appealing ASCII table"
HOMEPAGE="http://code.google.com/p/${PN}/"
SRC_URI="mirror://pypi/P/PrettyTable/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS=(CHANGELOG)

python_test() {
	"${PYTHON}" ./setup.py test || die "Tests failed with ${PYTHON}"
}
