# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"

inherit jnrowe-pypi

DESCRIPTION="Python 2 and 3 compatibility utilities"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="doc? ( dev-python/sphinx )"
RDEPEND=""

PYTHON_MODNAME="${PN}.py"

src_compile() {
	distutils_src_compile

	if use doc; then
		pushd documentation >/dev/null
		emake html || die "emake html failed"
		popd >/dev/null
	fi
}

src_install() {
	distutils_src_install

	if use doc; then
		dohtml -r documentation/_build/html/* || die "dohtml failed"
	fi
}
