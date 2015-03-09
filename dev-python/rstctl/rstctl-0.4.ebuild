# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="A script to help you with authoring reStructuredText"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
# setuptools needed in RDEPEND for wrapper scripts
RDEPEND="${DEPEND}
	dev-python/beaker[${PYTHON_USEDEP}]
	dev-python/docutils[${PYTHON_USEDEP}]
	dev-python/mako[${PYTHON_USEDEP}]
	dev-python/pastescript[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]"
