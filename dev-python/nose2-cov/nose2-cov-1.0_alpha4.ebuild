# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# Python 2.5 isn't supported by nose2
PYTHON_COMPAT=(python{2_{6,7},3_{1..3}})
MY_PV="${PV/_alpha/a}"

inherit jnrowe-pypi

DESCRIPTION="nose2 plugin for coverage reporting"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/cov-core[${PYTHON_USEDEP}]
	dev-python/nose2[${PYTHON_USEDEP}]"

DOCS=(README.txt)
