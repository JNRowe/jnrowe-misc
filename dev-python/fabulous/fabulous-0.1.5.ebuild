# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted due to print syntax and unicode support
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Makes your terminal output totally fabulous"
HOMEPAGE="http://lobstertech.com/fabulous.html"
SRC_URI="http://lobstertech.com/media/file/fabulous/fabulous-0.1.5.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="dev-python/setuptools
	doc? ( dev-python/sphinx )"
RDEPEND="dev-python/grapefruit
	dev-python/imaging"

src_compile() {
	distutils_src_compile

	if use doc; then
		pushd docs >/dev/null
		emake html || die "emake html failed"
		popd >/dev/null
	fi
}

src_install() {
	distutils_src_install

	if use doc; then
		dohtml -r docs/_build/html/* || die "dohtml failed"
	fi
}
