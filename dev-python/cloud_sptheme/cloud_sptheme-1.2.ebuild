# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2"

inherit jnrowe-pypi

DESCRIPTION="A nice sphinx theme named 'Cloud', and some related extensions"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

RDEPEND="dev-python/sphinx"
DEPEND="doc? ( ${RDEPEND} )"

DOCS="CHANGES README"

src_compile() {
	python-distutils-ng_src_compile

	if use doc; then
		./setup.py build_sphinx
	fi
}

python_install_all() {
	if use doc; then
		dohtml -r build/sphinx/html
	fi
}
