# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit base

DESCRIPTION="A utility that generates continuous GPS data for running tests"
HOMEPAGE="http://users.hol.gr/~dzach/${PN}/index.html"
SRC_URI="mirror://sourceforge/gpsfeed/gpsfeed+.zip"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="app-text/dos2unix"
RDEPEND="${DEPEND}
	dev-lang/tk
	dev-tcltk/tcludp"

S="${WORKDIR}"

PATCHES=("${FILESDIR}"/${P}-build_fixes.patch)

src_prepare() {
	base_src_prepare

	dos2unix gpsfeed+.tcl
}

src_install() {
	dobin gpsfeed+.tcl
}
