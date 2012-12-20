# Copyright © 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python2_{5,6,7})

inherit jnrowe-pypi

DESCRIPTION="Doctest/UnitTest for shell"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="minimal"

DEPEND=""
RDEPEND="dev-python/CommandLineApp[${PYTHON_USEDEP}]
	!minimal? ( dev-python/paramiko )"

DOCS=(README)
