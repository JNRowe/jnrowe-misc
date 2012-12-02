# Copyright © 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A utility that generates continuous GPS data for running tests"
HOMEPAGE="http://users.hol.gr/~dzach/${PN}/index.html"
SRC_URI="mirror://sourceforge/gpsfeed/gpsfeed+.zip"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lang/tk
	dev-tcltk/tcludp"

S="${WORKDIR}"

src_prepare() {
	sed -i -e 's,\r$,,' -e 's,wish8.4,wish,' gpsfeed+.tcl
}

src_install() {
	dobin gpsfeed+.tcl
}
