# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Colour output plugin for the nose testing framework"
HOMEPAGE="http://pypi.python.org/pypi/rudolf/"
SRC_URI="http://pypi.python.org/packages/source/${PN::1}/${PN}/${P}.tar.gz"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/nose"

# Tests fail to show how rudolf works
RESTRICT="test"

DOCS="CHANGES.txt"

src_test() {
	nosetests
}

