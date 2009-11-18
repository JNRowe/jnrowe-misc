# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils

DESCRIPTION="Pure-Python Git Library"
HOMEPAGE="http://samba.org/~jelmer/${P}"
SRC_URI="http://samba.org/~jelmer/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="doc test"

DEPEND="doc? ( dev-python/docutils )
	test? ( dev-python/nose )"
RDEPEND=""

src_prepare() {
	sed -i -e 's,rst2html,&.py,' -e 's,index.html,tutorial.html,' \
		docs/tutorial/Makefile
}

src_compile() {
	distutils_src_compile

	if use doc; then
		cd docs/tutorial
		make
	fi
}

src_install() {
	distutils_src_install

	if use doc; then
		dohtml docs/tutorial/tutorial.html
	fi
	dodoc HACKING docs/*.txt docs/tutorial/[0-9]*.txt
}
