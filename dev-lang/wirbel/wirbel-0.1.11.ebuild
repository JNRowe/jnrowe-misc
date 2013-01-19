# Copyright © 2009, 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils

DESCRIPTION="A compiled programming language with syntax and semantics similar to Python"
HOMEPAGE="http://mathias-kettner.de/${PN}.html"
SRC_URI="http://mathias-kettner.de/download/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RESTRICT="test"

DEPEND="sys-devel/bison
	sys-devel/flex
	${RDEPEND}"
RDEPEND="sys-libs/readline"

src_prepare() {
	epatch "${FILESDIR}"/${P}-gcc_4_4_fix.patch
}

src_install() {
	emake DESTDIR="${D}" docdir="\${datarootdir}/doc/${PF}" install \
		|| die "emake install failed"
}
