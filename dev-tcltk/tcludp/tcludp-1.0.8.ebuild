# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Create UDP sockets in Tcl"
HOMEPAGE="http://tcludp.sourceforge.net/"
SRC_URI="mirror://sourceforge/tcludp/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND="dev-lang/tcl"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i '/^SHLIB_LD	/s,$, $(LDFLAGS),' Makefile.in
}

src_install() {
	default

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins -r demos
	fi
}
