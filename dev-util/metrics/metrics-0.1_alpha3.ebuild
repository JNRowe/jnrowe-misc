# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

# 2.5 is restricted due to bytes syntax
# 3.* is restricted due to print and Unicode syntax
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_6 python2_7"
MY_P="${P/_alpha/a}"

inherit jnrowe-pypi

DESCRIPTION="Produces metrics for C, C++, Javascript, and Python programs"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/pygments"

DOCS=(README)
