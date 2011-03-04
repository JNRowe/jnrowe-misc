# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"

MY_PN="Benchmarker"

inherit jnrowe-pypi

DESCRIPTION="A small utility to benchmark your Python code"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND=""
RDEPEND="${DEPEND}"

PYTHON_MODNAME="${PN}.py"

DOCS="CHANGES.txt"

src_test() {
	testing() {
		if [[ "${PYTHON_ABI}" == "2.4" ]]; then
			einfo "Skipping tests with Python v2.4, due to context handlers"
			return
		fi

		"$(PYTHON)" test/benchmarker_test.py || die "benchmarker_test failed"
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	insinto /usr/share/doc/${PF}
	if use examples; then
		doins -r examples
	fi
}
