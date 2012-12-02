# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="A tool to programmatically control windows inside X"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND="dev-python/setuptools
	test? ( dev-python/py )"
RDEPEND="dev-python/pyrepl
	x11-apps/xprop
	x11-misc/wmctrl"

#  Tests need Xvfb support before they can be used
RESTRICT="test"
