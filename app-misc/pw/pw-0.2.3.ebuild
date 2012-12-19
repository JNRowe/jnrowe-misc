# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
# 2.5 is restricted due to collections.namedtuple use
# 3.x is restricted due to non-relative imports
PYTHON_COMPAT=(python2_{6,7})

inherit jnrowe-pypi

DESCRIPTION="Grep GnuPG-encrypted YAML password safe"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for entry points usage
RDEPEND="${DEPEND}
	dev-python/pyyaml
	dev-python/termcolor[${PYTHON_USEDEP}]
	dev-python/xerox[${PYTHON_USEDEP}]"

DOCS=(README.rst)
