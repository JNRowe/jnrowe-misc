# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
DISTUTILS_SRC_TEST="nosetests"

inherit distutils

DESCRIPTION="Calculations for the position of the sun"
HOMEPAGE="http://www.sffjunkie.co.uk/python-astral.html"
SRC_URI="http://www.sffjunkie.co.uk/files/python/${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

RDEPEND="dev-python/pytz"
DEPEND="test? ( ${RDEPEND} )"

PYTHON_MODNAME="${PN}.py"
RESTRICT_PYTHON_ABIS="3.*"

src_install() {
	distutils_src_install
	dohtml -r doc/ || die "dohtml failed"
}
