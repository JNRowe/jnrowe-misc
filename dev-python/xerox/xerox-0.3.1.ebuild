# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*:2.6"
# 2.4 isn't supported because of relative imports
# 2.5 isn't supported because of wildcard imports
RESTRICT_PYTHON_ABIS="2.[45]"
#DISTUTILS_SRC_TEST="nosetests"

inherit jnrowe-pypi

DESCRIPTION="Simple copy and paste in Python"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	x11-misc/xclip"

# Tests are restricted as they /can/ overwrite the user's clipboard
# setting.  Frankly, this isn't an interesting enough project to warrant
# a fake X session for a single test.
RESTRICT="test"
