# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2"

inherit jnrowe-pypi

DESCRIPTION="An astonishingly awesome application argument helper"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="|| ( dev-python/argparse >=dev-lang/python-2.7 )"
DEPEND="${RDEPEND}
	dev-python/setuptools"

DOCS=(README.rst)
