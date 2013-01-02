# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
# 3.x prior 3.2.3 is restricted due to http://bugs.python.org/issue10570
PYTHON_COMPAT=(python{2_{5..7},3_3})

inherit jnrowe-pypi

DESCRIPTION="Thin and practical terminal formatting, positioning, and more"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND="test? ( dev-python/nose )"
RDEPEND=""

RESTRICT="test"

python_test() {
	"${EPYTHON}" ./setup.py test || die "Tests failed with ${EPYTHON}"
}
