# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# 3.x is restricted due to file() usage and exception syntax
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Expecter Gadget, a better expectation (assertion) library"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

DEPEND="dev-python/setuptools"
RDEPEND=""

DOCS=(README.txt)
