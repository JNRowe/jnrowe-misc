# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit toolchain-funcs

DESCRIPTION="A simple window matching utility, like devilspie"
HOMEPAGE="DEAD"
SRC_URI="http://www.jnrowe.ukfsn.org/_downloads/${P}.tar.bz2"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"

src_configure() {
	# Handmade configure script
	CC="$(tc-getCC)" ./configure || die "configure failed"
}

src_install() {
	dobin ${PN}
}
