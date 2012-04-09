# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2"

inherit python-distutils-ng

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

python_install_all() {
	local file
	for file in ovl2kml ovl2gpx kml2ovl kml2gpx gpx2ovl gpx2kml; do
		python-distutils-ng_redoscript "/usr/bin/${file}.py"
	done
}
