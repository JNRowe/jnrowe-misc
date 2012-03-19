# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.6"
# 2.5 isn't supported because of conditional expressions with __future__ import
# 3.x isn't supported because of octal syntax
RESTRICT_PYTHON_ABIS="2.5 3.*"
PYPI_ARCHIVE_SUFFIX="zip"

inherit base jnrowe-pypi

DESCRIPTION="Declarative terminal tool programming"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="doc? ( dev-python/sphinx )"
RDEPEND="|| ( dev-python/argparse >=dev-lang/python-2.7 )
	dev-python/prettytable
	dev-python/progressbar"

PATCHES=("${FILESDIR}"/${P}-Removed_unused_intersphinx_settings.patch)

DOCS="docs/guide.rst docs/reference.rst"

PYTHON_MODNAME="${PN}.py"

src_prepare() {
	base_src_prepare
	distutils_src_prepare
}

src_compile() {
	distutils_src_compile

	if use doc; then
		pushd docs >/dev/null
		make html
		popd >/dev/null
	fi
}

src_install() {
	distutils_src_install

	if use doc; then
		dohtml -r docs/_build/html/* || die "dohtml failed"
	fi
}
