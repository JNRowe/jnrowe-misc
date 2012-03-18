# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools

DESCRIPTION="Read-only compressed file-system emulation."
HOMEPAGE="http://${PN}.linux.lu/"
SRC_URI="${HOMEPAGE}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	# Remove hardcoded "optimisations"
	sed -i '/X\$GCC/,/^fi/d' configure.in
	# Respect LDFLAGS.
	sed -i 's,$(LIBS),$(LDFLAGS) &,' Makefile.in
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
	dodoc CHANGES README ${PN}.conf.sample
}
