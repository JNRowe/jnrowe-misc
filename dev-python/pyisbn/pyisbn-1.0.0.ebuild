# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python{2_7,3_{3,4}})

inherit jnrowe-pypi

DESCRIPTION="A module for working with 10- and 13-digit ISBNs"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )"
RDEPEND=""

DOCS=(CONTRIBUTING.rst NEWS.rst README.rst)

python_compile_all() {
	if use doc; then
		pushd doc >/dev/null
		emake html || die "emake html failed"
		popd >/dev/null
	fi
}

python_install_all() {
	distutils-r1_python_install_all

	if use doc; then
		dohtml -r doc/.build/html/* || die "dohtml failed"
	fi
}
