# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_{6,7},3_{2,3}})

inherit jnrowe-pypi

DESCRIPTION="nosetests output colourising plugin"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/nose[${PYTHON_USEDEP}]"
