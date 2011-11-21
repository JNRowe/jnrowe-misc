# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.5"
# 2.5 is required for funcparserlib dependency, 3.x is not supported because of
# print syntax.
RESTRICT_PYTHON_ABIS="2.4 3.*"

inherit eutils jnrowe-pypi

DESCRIPTION="Generate block-diagram image files from text(like dot)"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="examples pdf"

# dev-python/imaging has to be in DEPEND, because of the automagic
# foolishness that occurs in setup.py
DEPEND="dev-python/setuptools
	dev-python/imaging"
RDEPEND="dev-python/funcparserlib
	dev-python/imaging
	dev-python/webcolors
	pdf? ( dev-python/reportlab )"

DOCS="src/README.txt src/TODO.txt"

src_test() {
	testing() {
		PYTHONPATH="$PWD/src" "$(PYTHON)" src/${PN}/tests/test_parser.py \
			|| die "test_parser.py failed"
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	doman ${PN}.1
	insinto /usr/share/doc/${PF}
	if use examples ; then
		doins -r examples || die "doins failed"
	fi
}
