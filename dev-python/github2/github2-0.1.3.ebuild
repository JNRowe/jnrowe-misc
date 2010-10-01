# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"
DISTUTILS_SRC_TEST="nosetests"

inherit base jnrowe-pypi

DESCRIPTION="Github API v2 library for Python"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND="dev-python/setuptools"
RDEPEND=""

PATCHES=("${FILESDIR}"/${P}-setuptools_find_packages_breakage.patch)

src_prepare() {
	base_src_prepare
	distutils_src_prepare
}

src_test() {
	testing() {
		if [ "${PYTHON_ABI::1}" = 3 ]; then
			einfo "Skipping tests with Python v3, due to lack of nose support"
			return
		fi
		nosetests-${PYTHON_ABI} || die "nosetests failed"
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	# Only one example now, but others will apparently follow
	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins examples/*
	fi
}
