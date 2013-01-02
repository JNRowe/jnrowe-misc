# Copyright © 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
# No 2.5 or 3.x - missing pyhistorian
PYTHON_COMPAT=(python2_{6,7})

inherit jnrowe-pypi

DESCRIPTION="A Cucumber-like BDD framework built on top of Pyhistorian"
HOMEPAGE="https://github.com/hugobr/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/story_parser[${PYTHON_USEDEP}]
	dev-python/pyhistorian[${PYTHON_USEDEP}]"

DOCS=(README.rst)
