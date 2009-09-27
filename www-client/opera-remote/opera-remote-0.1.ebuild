# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit toolchain-funcs

DESCRIPTION="Send remote commands to a running Opera instance"
HOMEPAGE="http://goron.de/~froese/opera-remote/"
SRC_URI="${HOMEPAGE}readme.txt -> ${P}-readme.txt
	${HOMEPAGE}${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="x11-libs/libX11"
DEPEND="${RDEPEND}
	x11-proto/xproto"

src_prepare() {
	sed -i -e "s,-Os,${CFLAGS}," -e "/LDFLAGS/d" Makefile
}

src_compile() {
	emake CC="$(tc-getCC)" || die "emake failed"
}

src_install() {
	dobin ${PN}
	newdoc "${DISTDIR}"/${P}-readme.txt readme.txt
}
