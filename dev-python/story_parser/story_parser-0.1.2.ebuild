# Copyright © 2009, 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2 python3_3"

inherit jnrowe-pypi

DESCRIPTION="A Given/When/Then BDD stories parser"
HOMEPAGE="https://github.com/hugobr/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND="dev-python/setuptools
	test? ( dev-python/should_dsl )"
RDEPEND=""

# Tests aren't usable in portage environment in current release
RESTRICT="test"

DOCS=(README.rst)

src_prepare() {
	# Not needed, and interferes with src_install
	rm Makefile

	python-distutils-ng_src_prepare
}
