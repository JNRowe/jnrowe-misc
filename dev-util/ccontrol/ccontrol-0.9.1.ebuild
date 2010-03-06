# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit multilib

DESCRIPTION="Utility to manage ccache and distcc"
HOMEPAGE="http://ccontrol.ozlabs.org/"
SRC_URI="${HOMEPAGE}/releases/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

# Tests are currently restricted due to a problem with valgrind, once this is
# fixed tests will be reenabled.
RESTRICT="test"

DEPEND="app-text/asciidoc
	app-text/xmlto
	test? ( dev-util/valgrind )"
RDEPEND=""

src_configure() {
	# This can't use econf because it is a hand-hacked shell script.
	./configure --bindir=/usr/bin --libdir=/usr/$(get_libdir)/${PN} \
		--mandir=/usr/share/man \
		$(use test || echo --disable-valgrind) || die "configure failed"
}

src_install() {
	emake prefix="${D}" install || die "make install failed"

	dodoc CHANGES README TODO
}
