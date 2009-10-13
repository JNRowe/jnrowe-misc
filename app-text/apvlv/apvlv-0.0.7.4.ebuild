# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="apvlv is a PDF Viewer which behaves like Vim"
HOMEPAGE="http://code.google.com/p/${PN}/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="${RDEPEND}
	dev-util/pkgconfig"
RDEPEND="virtual/poppler-glib
	x11-libs/gtk+:2"

src_configure() {
	econf --with-docdir="\${datarootdir}/doc/${PF}"
}

src_install() {
	emake DESTDIR="${D}" sysconfdir="${D}"/etc install \
		|| die "make install failed"
}
