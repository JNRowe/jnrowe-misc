# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools

DESCRIPTION="Read-only compressed file-system emulation."
HOMEPAGE="http://zlibc.linux.lu/"
SRC_URI="${HOMEPAGE}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
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
	emake all info || die "emake failed"
}

src_install() {
	# Makefile is massively broken, and installing a few files manually is much
	# faster than rewriting the Makefile.
	dolib uncompress.so || die "dolib failed"
	doinfo ${PN}.info || die "doinfo failed"
	dodoc CHANGES README ${PN}.conf.sample || die "dodoc failed"
}
