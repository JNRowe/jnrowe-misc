# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*:2.6"
DISTUTILS_SRC_TEST="nosetests"
# 2.5 isn't supported because of context managers
RESTRICT_PYTHON_ABIS="2.5"

inherit distutils

DESCRIPTION="C parser and AST generator written in Python"
HOMEPAGE="http://code.google.com/p/${PN}/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

# pyyaml is needed at build-time if we start regenerating c_ast.py.
# nose v1 is required for Python 3 support
DEPEND="test? ( >=dev-python/nose-1.0.0 )"
RDEPEND="dev-python/ply"

src_prepare() {
	# Fix location of test files
	sed -i 's,c_files/,tests/&,' tests/*.py
	# Broken test, crappy match because of DOS line format
	sed -i '/def test_with_cpp/,/^\r$/d' tests/test_general.py
}

# Despite advice in README.txt, we won't run _build_tables.py in src_compile
# because it is pregenerated in the zipfile and requires specific patching for
# relative imports.

src_install() {
	distutils_src_install

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins -r examples/*
	fi
}
