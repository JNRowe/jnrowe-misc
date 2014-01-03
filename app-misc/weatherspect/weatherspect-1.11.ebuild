# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils

DESCRIPTION="Create an ASCII animation that simulates the weather"
HOMEPAGE="http://www.robobunny.com/projects/${PN}/html/"
SRC_URI="http://www.robobunny.com/projects/${PN}/${PN}_v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
# This bundles a copy of dev-perl/Weather-Underground to work around
# breakages, normally it would mean a package.mask but as this is just a toy...
RDEPEND=">=dev-perl/Term-Animation-2.5
	dev-perl/libwww-perl"

S=${WORKDIR}/${PN}_v${PV}

src_install() {
	dobin ${PN}
	einstalldocs
}
