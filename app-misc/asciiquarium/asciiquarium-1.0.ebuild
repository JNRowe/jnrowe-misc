# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Enjoy the mysteries of the sea from the safety of your own terminal"
HOMEPAGE="http://www.robobunny.com/projects/asciiquarium/html/"
SRC_URI="http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz
	-> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="dev-perl/Term-Animation"

S=${WORKDIR}/${PN}_${PV}

src_install() {
	dobin ${PN}
	dodoc CHANGES README
}
