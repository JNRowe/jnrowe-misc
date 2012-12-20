# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python{2_{5,6,7},3_{1,2,3}})

inherit jnrowe-pypi

DESCRIPTION="Behaviour-driven development, Python style"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for entry points
RDEPEND="${DEPEND}
	dev-python/parse
	python_targets_python2_5? ( dev-python/simplejson )
	virtual/python-argparse[${PYTHON_USEDEP}]"

# Tests are unusable within portage environment
RESTRICT="test"

PATCHES=("${FILESDIR}"/${P}-dont_install_global_test.patch)
