# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="*"
SUPPORT_PYTHON_ABIS="1"

MY_PN="Benchmarker"
MY_P=${MY_PN}-${PV}

inherit jnrowe-pypi

DESCRIPTION="A small utility to benchmark your Python code"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

PYTHON_MODNAME="${PN}.py"

S="${WORKDIR}"/${MY_P}

src_test() {
	testing() {
		local no_ext=0
		if [ "${PYTHON_ABI}" = 2.4 ]; then
			einfo "Skipping some tests with v2.4, due to context managers usage"
			no_ext=1
		fi
		"$(PYTHON)" ${PN}.py || die "${PN}.py failed"
		if [ ${no_ext} == 0 ]; then
			"$(PYTHON)" test/test_benchmarker.py || die "test_benchmarker failed"
		fi
	}
	python_execute_function testing
}
