# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.5"
RESTRICT_PYTHON_ABIS="2.4 3.*"

inherit distutils eutils versionator

DESCRIPTION="Access the web service of del.icio.us via it's API through python"
HOMEPAGE="http://code.google.com/p/pydelicious/"
SRC_URI="http://pydelicious.googlecode.com/files/${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="minimal"

# Tests span network boundaries, making them totally unusable.
# If, at some point, network spanning tests are separated note that the
# package attempts to test the currently installed version of the
# library.
RESTRICT="test"

# setuptools is an optional dependency for setup.py, but favour reproducibilty.
DEPEND="app-arch/unzip
	dev-python/setuptools"
RDEPEND="!minimal? ( dev-python/feedparser )"

src_unpack() {
	# Doesn't unpack in to its own top-level directory.
	mkdir "${S}"; cd "${S}"
	unpack ${A}
}
