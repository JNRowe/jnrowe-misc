# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="A utility that generates continuous GPS data for running tests"
HOMEPAGE="http://users.hol.gr/~dzach/gpsfeed/index.html"
SRC_URI="mirror://sourceforge/gpsfeed/gpsfeed+.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
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
	dobin gpsfeed+.tcl || die "dobin gpsfeed+.tcl failed"
}
