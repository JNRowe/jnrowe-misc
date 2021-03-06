# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# Python 3 is resticted due to print syntax
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="Minimalistic Python build tool inspired by Rake"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/colorama[${PYTHON_USEDEP}]"

DOCS=(README.rst)
