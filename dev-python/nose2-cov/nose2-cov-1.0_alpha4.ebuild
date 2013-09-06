# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 2.6 is skipped because of cov-core dependency
PYTHON_COMPAT=(python{2_7,3_{2,3}})
MY_PV="${PV/_alpha/a}"

inherit jnrowe-pypi

DESCRIPTION="nose2 plugin for coverage reporting"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/cov-core[${PYTHON_USEDEP}]
	dev-python/nose2[${PYTHON_USEDEP}]"

DOCS=(README.txt)
