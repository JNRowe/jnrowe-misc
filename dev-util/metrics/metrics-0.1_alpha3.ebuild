# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 2.5 is restricted due to bytes syntax
# 3.* is restricted due to print and Unicode syntax
PYTHON_COMPAT=(python2_{6,7})
MY_P="${P/_alpha/a}"

inherit jnrowe-pypi

DESCRIPTION="Produces metrics for C, C++, Javascript, and Python programs"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/pygments[${PYTHON_USEDEP}]"

DOCS=(README)
