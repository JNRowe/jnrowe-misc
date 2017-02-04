# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="A BDD tool for writing specs using Given-When-Then template"
HOMEPAGE="https://github.com/hugobr/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/should_dsl[${PYTHON_USEDEP}]
	dev-python/termcolor[${PYTHON_USEDEP}]"

# Files required for tests are missing from archive
RESTRICT="test"

DOCS=(README.rst)
