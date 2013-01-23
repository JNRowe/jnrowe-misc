# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit base

DESCRIPTION="Create UDP sockets in Tcl"
HOMEPAGE="http://${PN}.sourceforge.net/"
SRC_URI="mirror://sourceforge/tcludp/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND="dev-lang/tcl"
RDEPEND="${DEPEND}"

PATCHES=("${FILESDIR}"/${P}-build_fixes.patch)

src_install() {
	default

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins -r demos
	fi
}
