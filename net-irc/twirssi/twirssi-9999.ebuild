# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit git eutils

EGIT_REPO_URI="git://github.com/zigdon/${PN}.git"

DESCRIPTION="An irssi script allowing the use of Twitter from within irssi"
HOMEPAGE="http://www.twirssi.com/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="minimal"

DEPEND=""
RDEPEND="net-irc/irssi
	!minimal? (
		dev-perl/Net-Twitter
		dev-perl/WWW-Shorten
	)
	minimal? ( dev-perl/Net-Twitter-Lite )"

src_prepare() {
	# From http://git.sommitrealweird.co.uk/gitweb?p=twirssi-net-twitter-lite.git
	use minimal && epatch "${FILESDIR}"/${P}-Make-work-with-Net-Twitter-Lite.patch
}

src_install() {
	insinto /usr/share/irssi/scripts
	doins ${PN}.pl || die "doins failed"
	dohtml html/*.html || die "dohtml failed"
}

pkg_postinst() {
	if use minimal; then
		einfo "Install dev-perl/WWW-Shorten for automated URL shortening when"
		einfo "tweeting with this script."
	fi
}
