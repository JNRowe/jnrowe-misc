# Copyright © 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Doctest/UnitTest for shell"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="minimal"

DEPEND=""
RDEPEND="dev-python/CommandLineApp
	!minimal? ( dev-python/paramiko )"

DOCS=(README)
