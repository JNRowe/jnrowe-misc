# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.6"
# 2.5 is restricted due to unavailable dependencies and 2.6+ syntax
# 3.x is restricted due to blessings dependency
RESTRICT_PYTHON_ABIS="2.5 3.*"
DISTUTILS_SRC_TEST="nosetests"
PYPI_OLD_DISTUTILS=1

inherit jnrowe-pypi

DESCRIPTION="Simple client for GitHub issues"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

# setuptools is needed for command line wrappers
CDEPEND="dev-python/setuptools"
DEPEND="${CDEPEND}
	doc? (
		dev-python/cloud_sptheme
		dev-python/sphinx
		dev-python/sphinxcontrib-cheeseshop
	)
	test? (
		dev-python/nose
		dev-python/mock
	)"
RDEPEND="${CDEPEND}
	dev-python/argh
	dev-python/blessings
	>=dev-python/github2-0.6.1
	dev-python/html2text
	dev-python/jinja
	dev-python/misaka
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
