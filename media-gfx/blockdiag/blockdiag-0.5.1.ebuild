# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.6"
# 2.6 is required for collections.namedtuple, 3.x is not supported because of
# print syntax.
RESTRICT_PYTHON_ABIS="2.[45] 3.*"

inherit eutils jnrowe-pypi

DESCRIPTION="Generate block-diagram image files from text(like dot)"

LICENSE="PSF-2.4"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/funcparserlib
	dev-python/imaging"

DOCS="src/README.txt src/TODO.txt"

src_test() {
	testing() {
		PYTHONPATH=$PWD/src "$(PYTHON)" src/${PN}/tests/test_parser.py \
			|| die "test_parser.py failed"
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	insinto /usr/share/doc/${PF}
	if use examples ; then
		doins -r examples || die "doins failed"
	fi
}
