# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Watches the X selection and displays context sensitive actions"
HOMEPAGE="http://offog.org/code/gselt.html"
SRC_URI="http://offog.org/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${RDEPEND}
	dev-util/pkgconfig"
RDEPEND="x11-libs/gtk+:2"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc NEWS README
}
