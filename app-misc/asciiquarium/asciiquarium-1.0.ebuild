# Copyright © 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Enjoy the mysteries of the sea from the safety of your own terminal"
HOMEPAGE="http://www.robobunny.com/projects/${PN}/html/"
SRC_URI="http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz
	-> ${P}.tar.gz"

LICENSE="GPL-2+"
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
