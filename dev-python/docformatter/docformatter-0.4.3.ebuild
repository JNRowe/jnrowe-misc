# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_7,3_4})

inherit jnrowe-pypi

DESCRIPTION="Formats docstrings to follow PEP 257"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

python_test() {
	"${EPYTHON}" test_${PN}.py || die "Tests failed with ${EPYTHON}"
}
