# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils games toolchain-funcs readme.gentoo

DESCRIPTION="A rewrite of the engine used in the game Flashback"
HOMEPAGE="http://cyxdown.free.fr/reminiscence"
SRC_URI="http://cyxdown.free.fr/reminiscence/${P}.tar.bz2"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="media-libs/libsdl[audio,joystick,video]"
RDEPEND="${DEPEND}"

PATCHES=("${FILESDIR}"/${P}-data_paths.patch)

src_compile() {
	emake CXX="$(tc-getCXX)" || die "emake failed"
}

src_install() {
	einstalldocs
	newgamesbin rs ${PN}

	prepgamesdirs

	readme.gentoo_create_doc
}
