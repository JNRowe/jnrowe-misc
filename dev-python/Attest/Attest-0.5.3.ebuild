# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 3.2 is restricted due to contextlib.nested usage
PYTHON_COMPAT=(python{2_{5..7},3_1})

inherit jnrowe-pypi

DESCRIPTION="Modern, Pythonic unit testing"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="minimal test"

DEPEND="python_targets_python2_5? ( test? ( dev-python/simplejson ) )"
RDEPEND="!minimal? (
		dev-python/lxml
		dev-python/progressbar
		dev-python/pygments
		python_targets_python2_5? ( dev-python/simplejson )
	)"

DOCS=(AUTHORS.rst CHANGES.rst)

python_test() {
	"${EPYTHON}" ./setup.py test || die "Tests failed with ${EPYTHON}"
}
