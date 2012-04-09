# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# 2.5 isn't supported because of conditional expressions with __future__ import
# 3.x isn't supported because of octal syntax
PYTHON_COMPAT="python2_6 python2_7"
PYPI_ARCHIVE_SUFFIX="zip"

inherit base jnrowe-pypi

DESCRIPTION="Declarative terminal tool programming"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="doc"

DEPEND="doc? ( dev-python/sphinx )"
RDEPEND="|| ( dev-python/argparse >=dev-lang/python-2.7 )
	dev-python/prettytable
	dev-python/progressbar"

PATCHES=("${FILESDIR}"/${P}-Removed_unused_intersphinx_settings.patch)

DOCS=(README.markdown docs/guide.rst docs/reference.rst)

src_prepare() {
	base_src_prepare

	python-distutils-ng_src_prepare
}

src_compile() {
	python-distutils-ng_src_compile

	if use doc; then
		pushd docs >/dev/null
		make html
		popd >/dev/null
	fi
}

python_install_all() {
	if use doc; then
		dohtml -r docs/_build/html/* || die "dohtml failed"
	fi
}
