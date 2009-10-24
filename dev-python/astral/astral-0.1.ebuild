# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Calculations for the position of the sun"
HOMEPAGE="http://www.sffjunkie.co.uk/python.html"
SRC_URI="http://www.sffjunkie.co.uk/files/python/astral-0.1.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
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
