# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_7,3_{3,4}})

inherit jnrowe-pypi

DESCRIPTION="A Given/When/Then BDD stories parser"
HOMEPAGE="https://github.com/hugobr/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/should_dsl[${PYTHON_USEDEP}] )"
RDEPEND=""

# Tests aren't usable in portage environment in current release
RESTRICT="test"

DOCS=(README.rst)

python_prepare_all() {
	# Not needed, and interferes with src_install
	rm Makefile
}
