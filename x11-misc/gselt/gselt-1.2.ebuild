# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Watches the X selection and displays context sensitive actions"
HOMEPAGE="http://offog.org/code/${PN}.html"
SRC_URI="http://offog.org/files/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="x11-libs/gtk+:2"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=(NEWS README)

src_install() {
	default

	# Overkill to edit Makefile.am, and run autotools just to kill a single file
	rm -rf "${D}"/usr/share/${PN}

	insinto /usr/share/doc/${PF}/examples
	doins dot-gselt
}
