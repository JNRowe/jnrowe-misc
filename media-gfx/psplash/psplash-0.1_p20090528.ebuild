# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit base autotools savedconfig

DESCRIPTION="A tiny userspace graphical boot splash screen"
HOMEPAGE="http://labs.o-hand.com/psplash/"
SRC_URI="https://github.com/downloads/JNRowe/misc-overlay/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}"/${PN}

DOCS=(README)

src_prepare() {
	use savedconfig && restore_config psplash-hand-img.h
	eautoreconf
}

src_install() {
	base_src_install
	save_config psplash-hand-img.h
}
