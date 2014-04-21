# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 3.2 is restricted due to contextlib.nested usage
PYTHON_COMPAT=(python2_{6,7})

inherit jnrowe-pypi

DESCRIPTION="Modern, Pythonic unit testing"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="minimal test"

RDEPEND="!minimal? (
		dev-python/lxml[${PYTHON_USEDEP}]
		dev-python/progressbar[${PYTHON_USEDEP}]
		dev-python/pygments[${PYTHON_USEDEP}]
	)"

DOCS=(AUTHORS.rst CHANGES.rst)

python_test() {
	"${EPYTHON}" ./setup.py test || die "Tests failed with ${EPYTHON}"
}
