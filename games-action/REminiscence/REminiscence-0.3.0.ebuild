# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils toolchain-funcs readme.gentoo-r1

DESCRIPTION="A rewrite of the engine used in the game Flashback"
HOMEPAGE="http://cyxdown.free.fr/reminiscence/"
SRC_URI="${HOMEPAGE}${P}.tar.bz2"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="media-libs/libmodplug
	media-libs/libsdl[joystick,sound,video]
	media-libs/libvorbis"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-data_paths.patch
}

src_compile() {
	emake CXX="$(tc-getCXX)" || die "emake failed"
}

src_install() {
	einstalldocs
	newbin rs ${PN}
	insinto /usr/share/REminiscence
	doins rs.cfg

	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}
