# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.5"
RESTRICT_PYTHON_ABIS="2.4 3.*"

inherit distutils eutils versionator

MY_P=${PN}-$(replace_version_separator 3 '-')

DESCRIPTION="Access the web service of del.icio.us via it's API through python"
HOMEPAGE="http://code.google.com/p/pydelicious/"
SRC_URI="http://pydelicious.googlecode.com/files/${MY_P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
# Tests are actually broken, not just failing
RESTRICT="test"

DEPEND="app-arch/unzip"
RDEPEND=""

src_unpack() {
	# Doesn't unpack in to its own top-level directory.
	mkdir "${S}"; cd "${S}"
	unpack ${A}
}

src_prepare() {
	epatch "${FILESDIR}"/${P}-hashlib.patch
}
