# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted due to Python 2-style unicode usage
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="OO representation of GPX and conversion utilities between GPX, KML and OVL"
HOMEPAGE="http://www.kette-links.de/technik.php?lang=en"
SRC_URI="http://www.kette-links.de/technik/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/egenix-mx-base"

PYTHON_MODNAME="gpxdata.py"
