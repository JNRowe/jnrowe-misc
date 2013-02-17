# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="A simple command-line based RSS enclosure downloader"
HOMEPAGE="http://www.nongnu.org/${PN}/"
SRC_URI="mirror://nongnu/${PN}/${P}.tar.bz2"

LICENSE="GPL-2+ LGPL-2.1+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+id3tag"

RDEPEND="dev-libs/glib
	dev-libs/libxml2
	net-misc/curl
	id3tag? ( media-libs/id3lib )"
DEPEND="${DEPEND}
	virtual/pkgconfig"

DOCS=(AUTHORS ChangeLog NEWS README TODO castgetrc.example)

src_configure() {
	econf $(use_enable id3tag id3lib)
}
