# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="Doctest/UnitTest for shell"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="minimal"

DEPEND=""
RDEPEND="dev-python/CommandLineApp[${PYTHON_USEDEP}]
	!minimal? ( dev-python/paramiko[${PYTHON_USEDEP}] )"

DOCS=(README)
