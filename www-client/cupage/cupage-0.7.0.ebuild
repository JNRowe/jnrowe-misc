# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.6"
RESTRICT_PYTHON_ABIS="2.5 3.*"
DISTUTILS_SRC_TEST="nosetests"

GITHUB_TAG=v${PV}
GITHUB_USER="JNRowe"

inherit base jnrowe-github distutils

DESCRIPTION="A tool to check for updates on web pages"
HOMEPAGE="http://jnrowe.github.com/${PN}/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="dev-python/docutils
	doc? (
		dev-python/cloud_sptheme
		dev-python/sphinx
		media-gfx/sphinxcontrib-blockdiag
	)"
RDEPEND="dev-python/blessings
	dev-python/configobj
	dev-python/httplib2
	dev-python/lxml"

PATCHES=("${FILESDIR}"/${P}-fix_distribute_entry_point.patch)

src_prepare() {
	base_src_prepare
	distutils_src_prepare
}

src_compile() {
	distutils_src_compile

	if use doc; then
		./setup.py build_sphinx || die "make documentation failed"
		sphinx-build -b man doc doc/.build/man
	fi
}

src_test() {
	testing() {
		nosetests-${PYTHON_ABI} --with-doctest || die "nosetests failed"
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	dodoc doc/*.rst || die "dodoc failed"
	if use doc; then
		dohtml -r doc/.build/html/* || die "dohtml failed"
		doman doc/.build/man/${PN}.1 || die "doman failed"
	fi
}
