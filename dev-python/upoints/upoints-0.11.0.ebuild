# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Modules for working with points on Earth"
HOMEPAGE="http://www.jnrowe.ukfsn.org/projects/upoints.html"
SRC_URI="http://www.jnrowe.ukfsn.org/_downloads/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"

src_test() {
	# Don't use test_doc as it requires net access
	./setup.py test_code
}

src_install() {
	distutils_src_install
	dohtml -r doc/*
}
