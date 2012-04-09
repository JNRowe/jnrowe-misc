# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# 2.5 isn't supported because of wildcard imports
PYTHON_COMPAT="python2_6 python2_7 python3_1 python3_2"

inherit jnrowe-pypi

DESCRIPTION="Simple copy and paste in Python"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	x11-misc/xclip"

# Tests are restricted as they /can/ overwrite the user's clipboard
# setting.  Frankly, this isn't an interesting enough project to warrant
# a fake X session for a single test.
RESTRICT="test"

DOCS=(README.rst)

src_install() {
	default

	python-distutils-ng_src_install
}
