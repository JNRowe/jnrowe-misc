# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"

inherit distutils

DESCRIPTION="OO representation of GPX and conversion utilities between GPX, KML and OVL"
HOMEPAGE="http://www.kette-links.de/technik/"
SRC_URI="http://www.kette-links.de/software/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/python-dateutil"

PYTHON_MODNAME="${PN}.py"
