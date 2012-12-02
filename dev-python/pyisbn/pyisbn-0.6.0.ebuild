# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2 python3_3"

inherit jnrowe-pypi

DESCRIPTION="A module for working with 10- and 13-digit ISBNs"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="dev-python/setuptools
	doc? ( dev-python/sphinx )"
RDEPEND=""

DOCS=(NEWS.rst README.rst)

src_compile() {
	python-distutils-ng_src_compile

	if use doc; then
		pushd doc >/dev/null
		emake html || die "emake html failed"
		popd >/dev/null
	fi
}

python_install_all() {
	if use doc; then
		dohtml -r doc/.build/html/* || die "dohtml failed"
	fi
}
