# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 3.x is restricted due to print syntax, and Unicode literals
PYTHON_COMPAT=(python2_{5..7})

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
	virtual/python-argparse[${PYTHON_USEDEP}]
	dev-python/calabash[${PYTHON_USEDEP}]"

PATCHES=("${FILESDIR}"/${P}-use_stdlib_json.patch)
