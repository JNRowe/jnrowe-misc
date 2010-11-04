# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x restricted due to exception syntax
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="nosetests"

inherit distutils

MY_P=${P/_alpha/a}

DESCRIPTION="A module to manipulate color information easily."
HOMEPAGE="http://code.google.com/p/grapefruit/"
SRC_URI="http://${PN}.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

DEPEND="dev-python/setuptools
	dev-python/sphinx"
RDEPEND="${DEPEND}"

PYTHON_MODNAME="grapefruit.py"

S="${WORKDIR}"/${MY_P}

DOCS="CHANGES"

src_unpack() {
	# Broken tarball, with no toplevel directory
	mkdir "${S}"; cd "${S}"
	unpack ${A}
}

src_compile(){
	distutils_src_compile

	if use doc; then
		pushd doc >/dev/null
		emake html || die "emake html failed"
		popd >/dev/null
	fi
}

src_test() {
	testing() {
		nosetests-${PYTHON_ABI} ${PN}_test.py || die "nosetests failed"
	}
	python_execute_function testing
}

src_install(){
	distutils_src_install

	if use doc; then
		dohtml -r doc/_build/html/* || die "dohtml failed"
	fi
}
