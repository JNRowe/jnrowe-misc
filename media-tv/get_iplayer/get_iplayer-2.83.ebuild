# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Search, index, record and stream BBC's iplayer content"
HOMEPAGE="http://www.infradead.org/get_iplayer/html/get_iplayer.html"
SRC_URI="ftp://ftp.infradead.org/pub/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="minimal"

RDEPEND="dev-perl/libwww-perl
	media-video/flvstreamer
	!minimal? (
		virtual/ffmpeg
	)"
DEPEND=""

src_install() {
	dobin ${PN}
	doman ${PN}.1

	insinto /usr/share/${PN}
	doins -r plugins

	dodoc CHANGELOG.txt CONTRIBUTORS README.md
	dohtml html/*
}
