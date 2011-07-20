# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit toolchain-funcs

DESCRIPTION="Tool for calculating sunrise and sunset, and sleeping until such an event."
HOMEPAGE="http://www.risacher.org/${PN}/"
SRC_URI="http://www.risacher.org/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	sed -i -e '/^CFLAGS/d' \
		-e 's/$(CC)/& $(LDFLAGS)/' \
		Makefile
	sed -i '6i#include <string.h>' main.c
}

src_compile() {
	emake CC="$(tc-getCC)" || die "emake failed"
}

src_install() {
	dobin ${PN} || die "dobin failed"
}
