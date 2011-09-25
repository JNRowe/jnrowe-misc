# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.6"
# 2.4 is restricted due to relative imports and conditional expressions
# 2.5 is restricted due to import syntax
# 3.x is restricted due to import syntax and missing support in dependencies
RESTRICT_PYTHON_ABIS="2.[45] 3.*"

inherit base jnrowe-pypi

DESCRIPTION="Python HTTP for Humans"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# setuptools is an optional dependency for setup.py, but favour reproducibilty.
DEPEND="dev-python/setuptools"
RDEPEND="|| ( >=dev-lang/python-2.6 dev-python/simplejson )
	dev-python/poster"

PATCHES=("${FILESDIR}"/${P}-fix_poster_bundling.patch)

DOCS="HISTORY.rst"

src_prepare() {
	base_src_prepare
	distutils_src_prepare
}
