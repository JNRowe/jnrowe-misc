# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=(python2_7)

inherit distutils-r1

DESCRIPTION="Access the web service of del.icio.us via it's API through python"
HOMEPAGE="http://code.google.com/p/${PN}/"
SRC_URI="http://pydelicious.googlecode.com/files/${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="minimal"

# Tests span network boundaries, making them totally unusable.
# If, at some point, network spanning tests are separated note that the
# package attempts to test the currently installed version of the
# library.
RESTRICT="test"

# setuptools is an optional dependency for setup.py, but favour reproducibilty.
DEPEND="app-arch/unzip
	dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="!minimal? ( dev-python/feedparser[${PYTHON_USEDEP}] )"

src_unpack() {
	# Doesn't unpack in to its own top-level directory.
	mkdir "${S}"; cd "${S}"
	unpack ${A}
}
