# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="A compiled programming language with syntax and semantics similar to Python"
HOMEPAGE="http://mathias-kettner.de/wirbel.html"
SRC_URI="http://mathias-kettner.de/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RESTRICT="test"

DEPEND="sys-devel/bison
	sys-devel/flex
	${RDEPEND}"
RDEPEND="sys-libs/readline"

src_install() {
	emake DESTDIR="${D}" docdir="\${datarootdir}/doc/${PF}" install \
		|| die "emake install failed"
}
