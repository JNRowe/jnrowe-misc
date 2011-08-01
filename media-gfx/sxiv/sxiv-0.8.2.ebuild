# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils savedconfig toolchain-funcs

DESCRIPTION="Simple (or small or suckless) X Image Viewer"
HOMEPAGE="https://github.com/muennich/sxiv/"
SRC_URI="https://github.com/downloads/muennich/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="media-libs/imlib2[X]"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-env_fixes.patch

	if use savedconfig; then
		restore_config config.h
	fi
}

src_compile() {
	emake CC="$(tc-getCC)" || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install \
		|| die "emake install failed"
	dodoc README.md || die

	save_config config.h
}
