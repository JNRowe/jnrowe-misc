# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Create an ASCII animation that simulates the weather"
HOMEPAGE="http://www.robobunny.com/projects/${PN}/html/"
SRC_URI="http://www.robobunny.com/projects/weatherspect/weatherspect.tar.gz
	-> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
# This bundles a copy of dev-perl/Weather-Underground to work around
# breakages, normally it would mean a package.mask but as this is just a toy...
RDEPEND=">=dev-perl/Term-Animation-2.5
	dev-perl/libwww-perl"

S=${WORKDIR}/${PN}_v${PV}

src_install() {
	dobin ${PN}
	dodoc CHANGES README
}
