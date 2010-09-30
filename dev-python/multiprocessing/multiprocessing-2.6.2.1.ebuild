# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.4:2.5"
# Multiprocessing is included in Python since 2.6
RESTRICT_PYTHON_ABIS="2.[67] 3.*"
DISTUTILS_SRC_TEST="nosetests"

inherit jnrowe-pypi

DESCRIPTION="Offers both local and remote concurrency, by using subprocesses"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="dev-python/setuptools
	doc? ( dev-python/sphinx )"
RDEPEND=""

# Tests are phenomenally broken
RESTRICT="test"

src_compile() {
	distutils_src_compile

	if use doc; then
		einfo "Generation of documentation"
		sphinx-build -b html Doc Doc_build || die "sphinx-build failed"
	fi
}

src_test() {
	testing() {
		pushd build-${PYTHON_ABI}/* >/dev/null
		nosetests-${PYTHON_ABI} ${PN} || die "nosetests failed"
		popd >/dev/null
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	if use doc; then
		docinto html
		dohtml -r Doc_build/ || die "HTML installation failed"
	fi
}
