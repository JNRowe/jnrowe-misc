# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="A tool to check for updates on web pages"
HOMEPAGE="http://github.com/JNRowe/cupage"
SRC_URI="http://github.com/JNRowe/cupage/tarball/${PV} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="doc"

DEPEND="dev-python/docutils
	doc? ( dev-python/sphinx )"
RDEPEND="dev-python/configobj
	dev-python/httplib2
	dev-python/lxml"

S="${WORKDIR}/JNRowe-${PN}-6f95360"

PYTHON_MODNAME="libcupage"
RESTRICT_PYTHON_ABIS="2.[45] 3.*"

src_compile() {
	distutils_src_compile

	rst2man.py doc/${PN}.1.rst doc/${PN}.1
	if use doc; then
		cd doc
		make html || die "make documentation failed"
	fi
}

src_test() {
	nosetests --with-doctest ${PN}.py
}

src_install() {
	distutils_src_install

	dodoc doc/*.rst || die "dodoc failed"
	doman doc/${PN}.1 || die "doman failed"
	if use doc; then
		dohtml -r doc/.build/html/* || die "dohtml failed"
	fi
}
