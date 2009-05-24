# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P=${P}-gamma
DESCRIPTION="A tiling window manager with mouse and keyboard control"
HOMEPAGE="http://unexist.scrapping.cc/projects/show/subtle"
SRC_URI="http://unexist.scrapping.cc/attachments/download/6/${MY_P}.tbz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-ruby/rake
	dev-util/pkgconfig
	x11-libs/libX11
	x11-proto/xproto"
RDEPEND="x11-libs/libX11
	dev-lang/ruby"

S="${WORKDIR}/${MY_P}"

src_compile() {
	rake destdir=${D}
}

src_install() {
	rake destdir=${D} install
	dodoc AUTHORS 
}
