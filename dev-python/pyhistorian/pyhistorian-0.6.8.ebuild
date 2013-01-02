# Copyright © 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
# No 2.5 - missing termcolor
PYTHON_COMPAT=(python2_{6,7})

inherit jnrowe-pypi

DESCRIPTION="A BDD tool for writing specs using Given-When-Then template"
HOMEPAGE="https://github.com/hugobr/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/should_dsl[${PYTHON_USEDEP}]
	dev-python/termcolor[${PYTHON_USEDEP}]"

# Files required for tests are missing from archive
RESTRICT="test"

DOCS=(README.rst)
