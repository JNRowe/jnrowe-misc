# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.5"
# 2.4 is restricted due to conditional expressions
RESTRICT_PYTHON_ABIS="2.4"

MY_PN="Benchmarker"
MY_P=${MY_PN}-${PV}

inherit jnrowe-pypi

DESCRIPTION="A small utility to benchmark your Python code"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

PYTHON_MODNAME="${PN}.py"

S="${WORKDIR}"/${MY_P}

DOCS="CHANGES.txt"

src_test() {
	testing() {
		"$(PYTHON)" test/benchmarker_test.py || die "benchmarker_test failed"
	}
	python_execute_function testing
}
