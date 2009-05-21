# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"
inherit games toolchain-funcs versionator

MY_P=${PN}-r$(get_version_component_range 3)
DESCRIPTION="A collection of small one-player puzzle games"
HOMEPAGE="http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
SRC_URI="${HOMEPAGE}/${MY_P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm ~ppc x86"
IUSE=""

DEPEND="dev-util/pkgconfig
	${RDEPEND}"
RDEPEND="x11-libs/gtk+:2"

S=${WORKDIR}/${MY_P}

src_unpack() {
	unpack ${A}; cd "${S}"

	epatch "${FILESDIR}"/${MY_P}-build_fixes.patch
}

src_compile() {
	emake CC="$(tc-getCC)" XFLAGS="${CFLAGS}" || die "emake failed"
}

src_install() {
	mkdir -p "${D}"/${GAMES_BINDIR}
	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc HACKING README puzzles.txt
}
