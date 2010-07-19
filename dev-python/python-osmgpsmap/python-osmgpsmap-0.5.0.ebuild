# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Python bindings for osm-gps-map"
HOMEPAGE="http://nzjrs.github.com/osm-gps-map/"
SRC_URI="http://www.johnstowers.co.nz/files/osm-gps-map/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-python/pygtk
	sci-geosciences/osm-gps-map"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

RESTRICT_PYTHON_ABIS="3.*"

# Results from make check aren't tests
RESTRICT="test"

src_configure() {
	# No-op configure, so econf isn't called as we're using the setup.py
	:
}
