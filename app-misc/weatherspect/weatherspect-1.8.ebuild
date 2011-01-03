# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Create an ASCII animation that simulates the weather"
HOMEPAGE="http://www.robobunny.com/projects/weatherspect/html/"
SRC_URI="http://www.robobunny.com/projects/weatherspect/weatherspect.tar.gz
	-> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="dev-perl/Term-Animation
	dev-perl/Weather-Underground"

S=${WORKDIR}/${PN}_v${PV}

src_install() {
	dobin ${PN} || die "dobin failed"
	dodoc CHANGES README || die "dodoc failed"
}
