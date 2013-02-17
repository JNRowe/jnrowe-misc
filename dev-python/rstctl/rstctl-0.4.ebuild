# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=(python2_{5..7})

inherit jnrowe-pypi

DESCRIPTION="A script to help you with authoring reStructuredText"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
# setuptools needed in RDEPEND for wrapper scripts
RDEPEND="${DEPEND}
	dev-python/beaker
	dev-python/docutils[${PYTHON_USEDEP}]
	dev-python/mako
	dev-python/pastescript
	dev-python/sphinx[${PYTHON_USEDEP}]"
