# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"

GITHUB_USER="JNRowe"

inherit distutils jnrowe-github

DESCRIPTION="Modules for working with points on Earth"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_test() {
	testing() {
		# Don't use test_doc as it requires net access
		./setup.py test_code
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install
	dodoc doc/*.txt
}
