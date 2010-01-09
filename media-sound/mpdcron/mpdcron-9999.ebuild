# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit autotools git

EGIT_REPO_URI="git://github.com/alip/mpdcron.git"

DESCRIPTION="A hook daemon for mpd, it polls mpd and runs hooks on events"
HOMEPAGE="http://alip.github.com/mpdcron/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="zsh-completion"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"
RDEPEND=">=dev-libs/glib-2.16
	>=dev-libs/libdaemon-0.12
	>=media-libs/libmpdclient-2.1"

src_prepare() {
	eautoreconf
}

src_install() {
	local docdir=/usr/share/doc/${PF}
	emake DESTDIR="${D}" docdir=${docdir} install \
		|| die "emake install failed"
	# Can't call prepalldocs for compression because of the example files.
	rm "${D}"/${docdir}/*.mkd
	dodoc  *.mkd

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins zsh-completion/_${PN}
	fi
}

