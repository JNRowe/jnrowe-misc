# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit base

DESCRIPTION="A simple command-line based RSS enclosure downloader"
HOMEPAGE="http://www.nongnu.org/castget/"
SRC_URI="mirror://nongnu/${PN}/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="id3tag"

RDEPEND="dev-libs/glib
	dev-libs/libxml2
	net-misc/curl
	id3tag? ( media-libs/id3lib )"
DEPEND="${DEPEND}
	dev-util/pkgconfig"

DOCS=(AUTHORS ChangeLog NEWS README TODO castgetrc.example)

src_configure() {
	econf $(use_enable id3tag id3lib)
}
