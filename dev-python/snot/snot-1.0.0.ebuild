# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_7,3_{3,4}})

inherit jnrowe-pypi

DESCRIPTION="nose/pytest output colourising plugin"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+nose pytest"

DEPEND=""
RDEPEND="nose? ( dev-python/nose[${PYTHON_USEDEP}] )
	pytest? ( dev-python/pytest[${PYTHON_USEDEP}] )"
