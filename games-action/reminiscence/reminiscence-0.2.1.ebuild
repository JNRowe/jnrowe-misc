# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils games toolchain-funcs

MY_P=REminiscence-${PV}

DESCRIPTION="A rewrite of the engine used in the game Flashback"
HOMEPAGE="http://cyxdown.free.fr/${PN}/"
SRC_URI="http://cyxdown.free.fr/reminiscence/${MY_P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="media-libs/libsdl[audio,joystick,video]"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_P}

src_prepare() {
	# Include user's CXXFLAGS
	sed -i 's,CXXFLAGS:=,CXXFLAGS+=,' Makefile

	epatch "${FILESDIR}"/${P}-data_paths.patch
	# Fix location of data.
	sed -i "s,GAMES_DATADIR,${GAMES_DATADIR}/${PN}," main.cpp
}

src_compile() {
	emake CXX="$(tc-getCXX)" || die "emake failed"
}

src_install() {
	dodoc README
	newgamesbin rs ${PN}

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	einfo "Copy the data files from the Amiga or DOS version of Flashback to"
	einfo "${GAMES_DATADIR}/${PN}, or specify their location with the"
	einfo "'--datapath' option at startup.  See the README file for more"
	einfo "information on required files and supported options."
}
