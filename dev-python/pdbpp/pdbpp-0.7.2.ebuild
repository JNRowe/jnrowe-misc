# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# No 2.{5,6} - missing fancycompleter
# 3.x is restricted due to exception syntax
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="An enhanced drop-in replacement for pdb"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/py[${PYTHON_USEDEP}] )"
RDEPEND="dev-python/fancycompleter[${PYTHON_USEDEP}]
	dev-python/wmctrl[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]"

DOCS=(README)
