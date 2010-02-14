# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Modules for working with points on Earth"
HOMEPAGE="http://www.jnrowe.ukfsn.org/projects/upoints.html"
SRC_URI="http://www.jnrowe.ukfsn.org/_downloads/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

RESTRICT_PYTHON_ABIS="2.4 3.*"

src_test() {
	# Don't use test_doc as it requires net access
	./setup.py test_code
}

src_install() {
	distutils_src_install
	dohtml -r doc/*
}
