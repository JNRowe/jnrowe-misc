# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# No python-dateutil support for 3.x in official tree
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="nosetests"

inherit base jnrowe-pypi

DESCRIPTION="Github API v2 library for Python"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples test"

DEPEND="dev-python/setuptools
	doc? (
		dev-python/cloud_sptheme
		dev-python/sphinx
		dev-python/sphinxcontrib-cheeseshop
	)
	test? (
		dev-python/nose
	)"
RDEPEND="|| ( >=dev-lang/python-2.6 dev-python/simplejson )
	>=dev-python/httplib2-0.7.1
	dev-python/python-dateutil"

DOCS="NEWS.rst"

PATCHES=("${FILESDIR}"/${P}-Python_2_4_fix.patch)

src_prepare() {
	base_src_prepare
	distutils_src_prepare
}

src_compile() {
	distutils_src_compile

	if use doc; then
		$(PYTHON -2) setup.py build_sphinx
	fi
}

src_install() {
	distutils_src_install

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins examples/*
	fi

	if use doc; then
		dohtml -r doc/.build/html/* || die "dohtml failed"
	fi
}
