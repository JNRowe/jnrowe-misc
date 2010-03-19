# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools savedconfig

DESCRIPTION="A tiny userspace graphical boot splash screen"
HOMEPAGE="http://labs.o-hand.com/psplash/"
SRC_URI="http://github.com/downloads/JNRowe/misc-overlay/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}"/${PN}

src_prepare() {
	use savedconfig && restore_config psplash-hand-img.h
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README
	save_config psplash-hand-img.h
}
