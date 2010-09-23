# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
WANT_AUTOMAKE=1.10

inherit base autotools

MY_P="lib${PN}-amalgamation-${PV}"

DESCRIPTION="A complete sqlite-based Spatial DBMS in a nutshell"
HOMEPAGE="http://www.gaia-gis.it/spatialite"
SRC_URI="http://www.gaia-gis.it/${PN}/${MY_P}.tar.gz"

LICENSE="MPL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+geos +proj"

DEPEND="dev-db/sqlite:3[extensions]
	geos? ( sci-libs/geos )
	proj? ( sci-libs/proj )"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

PATCHES=("${FILESDIR}"/${P}-system_sqlite.patch
	"${FILESDIR}"/${P}-use_system_libs.patch)
DOCS=(AUTHORS README)

src_prepare() {
	base_src_prepare
	eautoreconf
}

src_configure() {
	econf $(use_enable geos) $(use_enable proj)
}
