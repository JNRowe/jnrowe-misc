# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# 3.x is restricted due to print syntax, and Unicode literals
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Convert JSON to a UNIX-friendly line-based format"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for entry points usage
# We can't use 2.6's json because we need ordered dictionary support
RDEPEND="${DEPEND}
	virtual/python-argparse
	dev-python/calabash"

PATCHES=("${FILESDIR}"/${P}-use_stdlib_json.patch)
