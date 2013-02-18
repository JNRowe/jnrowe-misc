# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_{5..7},3_{1..3}})

inherit jnrowe-pypi

DESCRIPTION="An astonishingly awesome application argument helper"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="virtual/python-argparse[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools"

DOCS=(README.rst)
