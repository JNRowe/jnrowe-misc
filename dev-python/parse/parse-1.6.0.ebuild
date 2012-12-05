# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python2_5 python2_6 python2_7 python3_1 python3_2 python3_3)

inherit jnrowe-pypi

DESCRIPTION="Parse using a specification based on the Python format() syntax"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

python_test() {
	"${PYTHON}" test_parse.py
}
