# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"

inherit base jnrowe-pypi

DESCRIPTION="Github API v2 library for Python"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

DEPEND="dev-python/setuptools
	test? ( dev-python/nose )"
RDEPEND="|| ( >=dev-lang/python-2.6 dev-python/simplejson )"

DOCS="NEWS.rst"

PATCHES=("${FILESDIR}"/${P}-test_build_path.patch)

src_prepare() {
	base_src_prepare
	distutils_src_prepare
}

src_test() {
	testing() {
		nosetests-${PYTHON_ABI} tests/ || die "nosetests failed"
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	# Only one example now, but others will follow
	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins examples/*
	fi
}
