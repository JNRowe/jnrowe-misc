# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*:2.5"
DISTUTILS_SRC_TEST="nosetests"
# 2.4 isn't supported because of relative imports
RESTRICT_PYTHON_ABIS="2.4"

inherit distutils

DESCRIPTION="C parser and AST generator written in Python"
HOMEPAGE="http://code.google.com/p/pycparser/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.zip"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

# pyyaml is needed at build-time if we start regenerating c_ast.py.
DEPEND=""
RDEPEND="${DEPEND}
	dev-python/ply"

src_prepare() {
	sed -i 's,c_files/,tests/&,' tests/*.py
	# Broken test, crappy match because of DOS line format
	sed -i '/def test_with_cpp/,/^\r$/d' tests/test_general.py
}

# Despite advice in README.txt, we won't run _build_tables.py in src_compile
# because it is pregenerated in the zipfile and requires specific patching for
# relative imports.

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
		doins -r examples/*
	fi
}
