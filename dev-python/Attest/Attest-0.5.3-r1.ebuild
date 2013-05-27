# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 2.5 is missing because of lxml dep
# 3.2 is restricted due to contextlib.nested usage
PYTHON_COMPAT=(python{2_{6,7},3_1})

inherit jnrowe-pypi

DESCRIPTION="Modern, Pythonic unit testing"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="minimal test"

DEPEND="test? ( virtual/python-json[${PYTHON_USEDEP}] )"
RDEPEND="!minimal? (
		dev-python/lxml[${PYTHON_USEDEP}]
		dev-python/progressbar[${PYTHON_USEDEP}]
		dev-python/pygments[${PYTHON_USEDEP}]
		virtual/python-json[${PYTHON_USEDEP}]
	)"

DOCS=(AUTHORS.rst CHANGES.rst)

python_test() {
	"${EPYTHON}" ./setup.py test || die "Tests failed with ${EPYTHON}"
}
