# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 3.x restricted due to exception syntax
PYTHON_COMPAT=(python2_{5..7})

inherit distutils-r1

MY_P=${P/_alpha/a}

DESCRIPTION="A module to manipulate color information easily"
HOMEPAGE="http://code.google.com/p/${PN}/"
SRC_URI="http://${PN}.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_P}

DOCS=(CHANGES)

src_unpack() {
	# Broken tarball, with no toplevel directory
	mkdir "${S}"; cd "${S}"
	unpack ${A}
}

python_compile_all() {
	if use doc; then
		pushd doc >/dev/null
		emake html || die "emake html failed"
		popd >/dev/null
	fi
}

python_test() {
	nosetests grapefruit_test.py || die
}

python_install_all() {
	distutils-r1_python_install_all

	if use doc; then
		dohtml -r doc/_build/html/* || die "dohtml failed"
	fi
}
