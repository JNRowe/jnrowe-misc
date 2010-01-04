# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils toolchain-funcs

DESCRIPTION="Simple EWMH compatible window manager with titlebars and frames"
HOMEPAGE="http://www.gatorgitter.com/~maties/"
SRC_URI="${HOMEPAGE}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${RDEPEND}
	x11-proto/xextproto"
RDEPEND="x11-libs/libXext"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0.0.94-build_fixes.patch
}

src_compile() {
	emake CC="$(tc-getCC)" || die "emake failed"
}

src_install() {
	dobin ${PN}
	doman ${PN}.1
	dodoc BUGS ChangeLog README TODO default_matwmrc

	make_desktop_entry /etc/X11/Sessions/${PN} "A simple window manager for X11" \
		"" # no-icon

	echo -e "#!/bin/sh\n/usr/bin/${PN}" > "${T}/${PN}"
	exeinto /etc/X11/Sessions
	doexe "${T}/${PN}"
}

pkg_postinst() {
	einfo "${PN} uses xterm by default, but this can be changed so it is not"
	einfo "strict dependency.  You must install it manually if you wish to use"
	einfo "the default config."
}
