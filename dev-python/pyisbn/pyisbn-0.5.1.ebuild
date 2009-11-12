# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="A module for working with 10- and 13-digit ISBNs"
HOMEPAGE="http://www.jnrowe.ukfsn.org/projects/pyisbn.html"
SRC_URI="http://www.jnrowe.ukfsn.org/_downloads/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"

src_test() {
	./setup.py test_code test_doc
}
