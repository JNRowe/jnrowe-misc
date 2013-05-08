# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_{5..7},3_{1..3}})

inherit jnrowe-pypi

DESCRIPTION="Behaviour-driven development, Python style"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
# setuptools is required in RDEPEND for entry points
RDEPEND="${DEPEND}
	dev-python/parse[${PYTHON_USEDEP}]
	virtual/python-json[${PYTHON_USEDEP}]
	virtual/python-argparse[${PYTHON_USEDEP}]"

# Tests are unusable within portage environment
RESTRICT="test"

PATCHES=("${FILESDIR}"/${P}-dont_install_global_test.patch)
