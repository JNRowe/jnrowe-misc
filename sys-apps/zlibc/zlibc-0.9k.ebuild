# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit base eutils autotools

DESCRIPTION="Read-only compressed file-system emulation"
HOMEPAGE="http://${PN}.linux.lu/"
SRC_URI="${HOMEPAGE}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

PATCHES=("${FILESDIR}"/${P}-build_fixes.patch)

DOCS=(CHANGES README ${PN}.conf.sample)

src_prepare() {
	base_src_prepare

	eautoreconf
}

src_compile() {
	emake all info
}

src_install() {
	# Makefile is massively broken, and installing a few files manually is much
	# faster than rewriting the Makefile.
	dolib uncompress.so
	doinfo ${PN}.info
	einstalldocs
}
