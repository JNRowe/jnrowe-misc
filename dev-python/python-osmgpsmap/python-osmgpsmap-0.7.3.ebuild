# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_{5..7})

inherit distutils-r1

DESCRIPTION="Python bindings for osm-gps-map"
HOMEPAGE="http://nzjrs.github.io/osm-gps-map/"
SRC_URI="http://www.johnstowers.co.nz/files/osm-gps-map/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-python/pygtk
	~sci-geosciences/osm-gps-map-${PV}"
DEPEND="${RDEPEND}
	virtual/pkgconfig"
