# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# 2.5 isn't supported because of wildcard imports
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_6 python2_7 python3_1 python3_2 python3_3"

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
