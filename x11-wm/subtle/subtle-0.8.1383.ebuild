# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

MY_P=${P}-epsilon
DESCRIPTION="A tiling window manager with mouse and keyboard control"
HOMEPAGE="http://unexist.scrapping.cc/projects/show/subtle"
SRC_URI="http://unexist.scrapping.cc/attachments/download/20/${MY_P}.tbz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-ruby/rake
	dev-util/pkgconfig
	x11-libs/libX11
	x11-proto/xproto"
RDEPEND="x11-libs/libX11
	dev-lang/ruby"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	sed -i -e '/"cflags"/s,"-.*",'"\"${CFLAGS}\"," \
		-e '/"ldflags"/s!"-!'"\"${LDFLAGS} -!" \
		Rakefile
}

src_compile() {
	rake destdir="${D}" || die "rake failed"
}

src_install() {
	rake destdir="${D}" install || die "rake install failed"
	# INSTALL contains user information too
	dodoc AUTHORS INSTALL

	make_desktop_entry /etc/X11/Sessions/${PN} \
		'A tiling window manager with mouse and keyboard control' \
		"" # no-icon

	echo -e "#!/bin/sh\n/usr/bin/${PN}" > "${T}/${PN}"
	exeinto /etc/X11/Sessions
	doexe "${T}/${PN}"
}
