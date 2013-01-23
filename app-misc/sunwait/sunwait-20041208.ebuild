# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit base toolchain-funcs

DESCRIPTION="Tool for calculating sunrise and sunset, and sleeping until such an event"
HOMEPAGE="http://www.risacher.org/${PN}/"
SRC_URI="http://www.risacher.org/${PN}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

PATCHES=("${FILESDIR}"/${P}-build_fixes.patch)

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	dobin ${PN}
}
