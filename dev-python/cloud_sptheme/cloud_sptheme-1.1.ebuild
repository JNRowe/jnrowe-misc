# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted due to dependency on Sphinx
RESTRICT_PYTHON_ABIS="3.*"

inherit jnrowe-pypi

DESCRIPTION="A nice sphinx theme named 'Cloud', and some related extensions"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

RDEPEND="dev-python/sphinx"
DEPEND="doc? ( ${RDEPEND} )"

DOCS="CHANGES"

src_compile() {
	distutils_src_compile

	if use doc; then
		$(PYTHON -2) setup.py build_sphinx
	fi
}

src_install() {
	distutils_src_install

	if use doc; then
		dohtml -r build/sphinx/html
	fi
}