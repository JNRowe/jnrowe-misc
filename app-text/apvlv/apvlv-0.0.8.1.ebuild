# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
WANT_AUTOMAKE="1.10"

inherit autotools eutils

DESCRIPTION="apvlv is a PDF Viewer which behaves like Vim"
HOMEPAGE="http://code.google.com/p/${PN}/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="djvu"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"
RDEPEND="virtual/poppler-glib
	x11-libs/gtk+:2
	djvu? ( app-text/djvu )"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0.0.7.4-build_fixes.patch
	epatch "${FILESDIR}"/${P}-automagic_djvu.patch
	eautoreconf
}

src_configure() {
	# Package overrides standard --mandir setting with --with-mandir
	econf --with-docdir="/usr/share/doc/${PF}" \
		--with-mandir="/usr/share/man" \
		$(use_with djvu)
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
	make_desktop_entry /usr/bin/${PN} "PDF Viewer which behaves like Vim" \
		"" "Office;Viewer" # No icon currently
}
