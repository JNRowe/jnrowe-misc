# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.6"
# 2.{4,5} are restricted due to unavailable dependencies and 2.6+ syntax
# 3.x is restricted due to argh dependency
RESTRICT_PYTHON_ABIS="2.[45] 3.*"
DISTUTILS_SRC_TEST="nosetests"

inherit jnrowe-pypi

DESCRIPTION="Simple client for GitHub issues"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

DEPEND="dev-python/setuptools
	doc? (
		dev-python/cloud_sptheme
		dev-python/sphinx
		dev-python/sphinxcontrib-cheeseshop
	)
	test? (
		dev-python/nose
		dev-python/mock
	)"
# setuptools is needed for command line wrappers
RDEPEND="dev-python/setuptools
	dev-python/argh
	>=dev-python/github2-0.5.0
	dev-python/jinja
	dev-python/pygments"

src_compile() {
	distutils_src_compile

	if use doc; then
		$(PYTHON -2) setup.py build_sphinx
	fi
}

src_install() {
	distutils_src_install

	if use doc; then
		dohtml -r doc/.build/html/* || die "dohtml failed"
	fi
}
