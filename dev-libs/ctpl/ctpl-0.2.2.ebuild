# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit base

DESCRIPTION="A fast and easy templating library for C"
HOMEPAGE="http://ctpl.tuxfamily.org/"
SRC_URI="http://download.tuxfamily.org/ctpl/releases/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="doc"

RDEPEND="x11-libs/gtk+"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	doc? ( dev-util/gtk-doc )"

DOCS=(AUTHORS HACKING NEWS README THANKS TODO)

src_configure() {
	# This should be default for econf really.
	econf --disable-silent-rules \
		$(use doc gtk-doc)
}
