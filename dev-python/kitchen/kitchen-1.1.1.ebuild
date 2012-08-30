# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# Python 3.x isn't supported due to Unicode literal syntax
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Kitchen contains a cornucopia of useful code for Python"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="doc"

DEPEND=""
RDEPEND=""

DOCS=(HACKING README)

src_compile() {
	python-distutils-ng_src_compile

	if use doc; then
		python ./setup.py build_sphinx || die "build_sphinx failed"
	fi
}

python_install_all() {
	if use doc; then
		dohtml -r build/sphinx/html/
	fi
}
