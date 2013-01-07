# Copyright © 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Create UDP sockets in Tcl"
HOMEPAGE="http://${PN}.sourceforge.net/"
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
