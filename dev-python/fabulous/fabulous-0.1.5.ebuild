# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# 3.x is restricted due to print syntax and unicode support
PYTHON_COMPAT=(python2_7)

inherit distutils-r1

DESCRIPTION="Makes your terminal output totally fabulous"
HOMEPAGE="http://lobstertech.com/${PN}.html"
SRC_URI="http://lobstertech.com/media/file/fabulous/fabulous-0.1.5.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )"
RDEPEND="dev-python/grapefruit[${PYTHON_USEDEP}]
	virtual/python-imaging[${PYTHON_USEDEP}]"

python_compile_all() {
	if use doc; then
		pushd docs >/dev/null
		emake html || die "emake html failed"
		popd >/dev/null
	fi
}

python_install_all() {
	distutils-r1_python_install_all

	if use doc; then
		dohtml -r docs/_build/html/* || die "dohtml failed"
	fi
}
