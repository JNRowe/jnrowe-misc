# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit savedconfig

DESCRIPTION="A tiny userspace graphical boot splash screen"
HOMEPAGE="http://labs.o-hand.com/psplash/"
SRC_URI="http://labs.o-hand.com/sources/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	use savedconfig && restore_config psplash-hand-img.h
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	save_config psplash-hand-img.h
}
