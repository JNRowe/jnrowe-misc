# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="On-screen display with transparency"
HOMEPAGE="http://neugierig.org/software/ghosd/"
SRC_URI="http://neugierig.org/software/ghosd/download/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${RDEPEND}
	dev-util/pkgconfig"
RDEPEND="x11-libs/pango"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
