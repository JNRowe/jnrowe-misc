# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 2.6 is restricted due to upstream's incorrect termcolor ebuild
# 3.x is restricted due to non-relative imports
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="Grep GnuPG-encrypted YAML password safe"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
# setuptools is required in RDEPEND for entry points usage
RDEPEND="${DEPEND}
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/termcolor[${PYTHON_USEDEP}]
	dev-python/xerox[${PYTHON_USEDEP}]"

DOCS=(README.rst)
