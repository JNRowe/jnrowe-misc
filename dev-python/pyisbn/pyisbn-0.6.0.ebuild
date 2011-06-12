# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="*"
SUPPORT_PYTHON_ABIS="1"

inherit jnrowe-pypi

DESCRIPTION="A module for working with 10- and 13-digit ISBNs"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="doc"

DEPEND="dev-python/setuptools
	doc? ( dev-python/sphinx )"
RDEPEND=""

src_compile() {
	distutils_src_compile

	if use doc; then
		pushd doc >/dev/null
		emake html || die "emake html failed"
		popd >/dev/null
	fi
}

src_install() {
	distutils_src_install

	if use doc; then
		dohtml -r doc/.build/html/* || die "dohtml failed"
	fi
}
