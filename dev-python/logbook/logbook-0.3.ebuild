# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*:2.5"
# 2.4 isn't supported because of conditional expressions
RESTRICT_PYTHON_ABIS="2.4"
DISTUTILS_SRC_TEST="nosetests"
PYTHON_TESTS_RESTRICTED_ABIS="3.*"

MY_PN="Logbook"

inherit jnrowe-pypi

DESCRIPTION="A logging module replacement for Python"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	|| ( >=dev-lang/python-2.6 dev-python/simplejson )"

DOCS="CHANGES"
