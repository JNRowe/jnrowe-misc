# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

EGIT_REPO_URI="git://git.${PN}.info/${PN}.git"

DESCRIPTION="Windows Manager From Scratch"
HOMEPAGE="http://www.wmfs.info"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="+imlib2 xinerama xrandr"

DEPEND="x11-libs/libX11
	x11-libs/libXft
	x11-libs/libXinerama
	imlib2? ( media-libs/imlib2 )
	xrandr? ( x11-libs/libXrandr )"
RDEPEND="${DEPEND}"

DOCS=("README")

src_configure() {
	# Not autoconf, kinda works with econf but not very well.
	./configure --prefix "/usr" --xdg-config-dir "/etc/xdg" \
		--man-prefix "/usr/share/man" \
		$(use_with imlib2) \
		$(use_with xrandr)
}

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	default

	insinto /usr/share/doc/${PF}/examples
	doins scripts/status.sh
}
