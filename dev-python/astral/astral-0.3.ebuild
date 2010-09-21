# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="nosetests"

inherit distutils

DESCRIPTION="Calculations for the position of the sun"
HOMEPAGE="http://www.sffjunkie.co.uk/python-astral.html"
SRC_URI="http://www.sffjunkie.co.uk/files/python/${P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

RDEPEND="dev-python/pytz"
DEPEND="test? ( ${RDEPEND} )"

PYTHON_MODNAME="${PN}.py"

src_install() {
	distutils_src_install
	# Install .txt sources too, so we don't have broken links.
	dohtml -A txt -r doc/ || die "dohtml failed"
}
