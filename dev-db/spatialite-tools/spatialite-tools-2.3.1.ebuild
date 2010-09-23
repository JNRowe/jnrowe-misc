# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit base autotools

DESCRIPTION="Command line tools for spatialite"
HOMEPAGE="http://www.gaia-gis.it/spatialite"
SRC_URI="http://www.gaia-gis.it/spatialite/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+geos +proj readline"

DEPEND="~dev-db/spatialite-${PV}
	geos? ( dev-db/spatialite[geos] )
	proj? ( dev-db/spatialite[proj] )
	readline? ( sys-libs/readline )"
RDEPEND="${DEPEND}"

PATCHES=("${FILESDIR}"/${P}-system_sqlite.patch
	"${FILESDIR}"/${P}-use_shared_libs.patch)
DOCS=(AUTHORS README)

src_prepare() {
	base_src_prepare
	eautoconf
}

src_configure() {
	econf $(use_enable geos) $(use_enable proj) $(use_enable readline)
}
