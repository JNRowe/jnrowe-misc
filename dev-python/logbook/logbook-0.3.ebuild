# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*:2.5"
# 2.4 isn't supported because of conditional expressions
RESTRICT_PYTHON_ABIS="2.4"
DISTUTILS_SRC_TEST="nosetests"

MY_PN="Logbook"
MY_P=${MY_PN}-${PV}

inherit jnrowe-pypi

DESCRIPTION="A logging module replacement for Python"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	|| ( >=dev-lang/python-2.6 dev-python/simplejson )"

S="${WORKDIR}"/${MY_P}

DOCS="CHANGES"

src_test() {
	testing() {
		if [ "${PYTHON_ABI::1}" = 3 ]; then
			einfo "Skipping tests with Python v3, due to lack of nose support"
			return
		fi
		nosetests-${PYTHON_ABI} ${PN} || die "nosetests failed"
	}
	python_execute_function testing
}
