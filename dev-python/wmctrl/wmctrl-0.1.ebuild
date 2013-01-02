# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python2_{6,7})

inherit jnrowe-pypi

DESCRIPTION="A tool to programmatically control windows inside X"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND="dev-python/setuptools
	test? ( dev-python/py )"
RDEPEND="dev-python/pyrepl[${PYTHON_USEDEP}]
	x11-apps/xprop
	x11-misc/wmctrl"

#  Tests need Xvfb support before they can be used
RESTRICT="test"
