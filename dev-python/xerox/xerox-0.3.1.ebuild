# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_7,3_4})

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
