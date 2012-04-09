# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2"

inherit jnrowe-pypi

DESCRIPTION="Python 2 and 3 compatibility utilities"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="doc? ( dev-python/sphinx )"
RDEPEND=""

DOCS=(README documentation/index.rst)

src_compile() {
	python-distutils-ng_src_compile

	if use doc; then
		pushd documentation >/dev/null
		emake html || die "emake html failed"
		popd >/dev/null
	fi
}

python_install_all() {
	if use doc; then
		dohtml -r documentation/_build/html/* || die "dohtml failed"
	fi
}
