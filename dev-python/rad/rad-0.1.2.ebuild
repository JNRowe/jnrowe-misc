# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 3.x is restricted due to print command
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="A super easy console highlighter.  Text goes in, colour comes out"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/plac[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]"

DOCS=(README.rst)
