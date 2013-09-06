# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# No 3.x - missing pyhistorian
# 2.6 is restricted due to upstream's incorrect termcolor ebuild
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="A Cucumber-like BDD framework built on top of Pyhistorian"
HOMEPAGE="https://github.com/hugobr/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/story_parser[${PYTHON_USEDEP}]
	dev-python/pyhistorian[${PYTHON_USEDEP}]"

DOCS=(README.rst)
