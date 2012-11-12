# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="A BDD tool for writing specs using Given-When-Then template"
HOMEPAGE="https://github.com/hugobr/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/should_dsl
	dev-python/termcolor"

# Files required for tests are missing from archive
RESTRICT="test"

DOCS=(README.rst)

src_prepare() {
	# Not needed, and interferes with src_install
	rm Makefile

	python-distutils-ng_src_prepare
}
