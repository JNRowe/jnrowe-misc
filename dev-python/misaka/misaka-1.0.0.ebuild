# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*:2.5"
RESTRICT_PYTHON_ABIS="2.4"

inherit base jnrowe-pypi

DESCRIPTION="Python binding for the Sundown Markdown parser"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND=">=dev-python/cython-0.15
	dev-python/setuptools
	doc? ( dev-python/sphinx )"
RDEPEND=""

PATCHES=("${FILESDIR}"/${P}-remove_rdep_on_cython.patch)

# Include the benchmarking suite's test file, as it is a useful doc for writing
# Markdown
DOCS="THANKS benchmark/markdown-syntax.md"

src_prepare() {
	base_src_prepare
	distutils_src_prepare
}

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

	use doc && dohtml -r docs/_build/html/*
}
