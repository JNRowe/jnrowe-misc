# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils eutils

DESCRIPTION="Access the web service of del.icio.us via it's API through python"
HOMEPAGE="http://code.google.com/p/pydelicious/"
SRC_URI="http://pydelicious.googlecode.com/files/${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

src_prepare() {
	epatch "${FILESDIR}"/${P}-hashlib.patch
}
