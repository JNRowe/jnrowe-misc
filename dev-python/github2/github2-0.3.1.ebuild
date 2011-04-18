# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted, uses removed Python modules.
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="nosetests"

inherit jnrowe-pypi

DESCRIPTION="Github API v2 library for Python"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND="dev-python/setuptools"
RDEPEND="|| ( >=dev-lang/python-2.6 dev-python/simplejson )"

DOCS="NEWS.rst"

src_install() {
	distutils_src_install

	# Only one example now, but others will follow
	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins examples/*
	fi
}
