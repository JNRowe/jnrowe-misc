# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 2.5 is restricted due to context handlers(without __future__ import)
# 3.x is restricted due to octal syntax
PYTHON_COMPAT=(python2_{6,7})

inherit jnrowe-pypi

DESCRIPTION="Creates files and directories from templates"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for entry points usage
RDEPEND="${DEPEND}
	virtual/python-argparse[${PYTHON_USEDEP}]
	dev-python/jinja"

DOCS=(HISTORY.rst README.rst)
