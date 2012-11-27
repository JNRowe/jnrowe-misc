# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2 python3_3"

inherit jnrowe-pypi

DESCRIPTION="An astonishingly awesome application argument helper"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="python_targets_python2_5? ( dev-python/argparse )
	virtual/python-argparse"
DEPEND="${RDEPEND}
	dev-python/setuptools"

DOCS=(README.rst)
