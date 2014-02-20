# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_{6,7},3_{2,3}})

inherit jnrowe-pypi

DESCRIPTION="A nice sphinx theme named 'Cloud', and some related extensions"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND="dev-python/sphinx[${PYTHON_USEDEP}]"
DEPEND="doc? ( ${RDEPEND} )"

DOCS=(CHANGES README)

python_compile_all() {
	if use doc; then
		python ./setup.py build_sphinx || die "build_sphinx failed"
	fi
}

python_install_all() {
	distutils-r1_python_install_all

	if use doc; then
		dohtml -r build/sphinx/html
	fi
}
