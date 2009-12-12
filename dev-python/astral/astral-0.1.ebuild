# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils

DESCRIPTION="Calculations for the position of the sun"
HOMEPAGE="http://www.sffjunkie.co.uk/python-astral.html"
SRC_URI="http://www.sffjunkie.co.uk/files/python/${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND="test? ( dev-python/nose )"
RDEPEND="dev-python/pytz"

src_test() {
	nosetests
}

src_install() {
	distutils_src_install
	dohtml -r doc/
}
