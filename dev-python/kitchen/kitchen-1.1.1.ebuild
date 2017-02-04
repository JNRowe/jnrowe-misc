# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# Python 3.x isn't supported due to Unicode literal syntax
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="Kitchen contains a cornucopia of useful code for Python"

LICENSE="GPL-2+ LGPL-2.1+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND=""
RDEPEND=""

DOCS=(HACKING README)

python_compile_all() {
	if use doc; then
		python ./setup.py build_sphinx || die "build_sphinx failed"
	fi
}

python_install_all() {
	distutils-r1_python_install_all

	if use doc; then
		dohtml -r build/sphinx/html/
	fi
}
