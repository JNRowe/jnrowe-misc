# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# Python 2.5 is resticted due to new exception handling syntax
# Python 3 is resticted due to print syntax
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Minimalistic Python build tool inspired by Rake"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/colorama"

DOCS=(README.rst)
