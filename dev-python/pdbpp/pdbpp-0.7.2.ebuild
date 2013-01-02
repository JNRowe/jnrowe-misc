# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

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

DEPEND="dev-python/setuptools
	test? ( dev-python/py )"
RDEPEND="dev-python/fancycompleter[${PYTHON_USEDEP}]
	dev-python/wmctrl[${PYTHON_USEDEP}]
	dev-python/pygments"

DOCS=(README)
