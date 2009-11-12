# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit games toolchain-funcs versionator

MY_P=puzzles-r$(get_version_component_range 3)
DESCRIPTION="A collection of small one-player puzzle games"
HOMEPAGE="http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
SRC_URI="${HOMEPAGE}/${MY_P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm ppc x86"
IUSE=""

DEPEND="dev-util/pkgconfig
	${RDEPEND}"
RDEPEND="x11-libs/gtk+:2"

S=${WORKDIR}/${MY_P}

src_prepare() {
	epatch "${FILESDIR}"/${MY_P}-build_fixes.patch
}

src_compile() {
	emake CC="$(tc-getCC)" XFLAGS="${CFLAGS}" || die "emake failed"
}

src_install() {
	mkdir -p "${D}"/${GAMES_BINDIR}
	emake DESTDIR="${D}" install || die "emake install failed"

	local file name
	for file in *.R ; do
		[[ ${file} == "nullgame.R" ]] && continue
		name=$(sed -n 's/^[a-z]*\.exe://p' "${file}")
		file=${file%.R}
		newicon icons/${file}-48d24.png ${PN}-${file}.png || die
		make_desktop_entry "${GAMES_BINDIR}/${file}" "${name}" "${PN}-${file}"
	done

	dodoc HACKING puzzles.txt
}
