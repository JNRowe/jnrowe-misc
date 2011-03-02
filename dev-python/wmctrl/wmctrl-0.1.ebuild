# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"

inherit jnrowe-pypi

DESCRIPTION="A tool to programmatically control windows inside X"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools
	test? ( dev-python/py )"
RDEPEND="dev-python/pyrepl
	x11-apps/xprop
	x11-misc/wmctrl"

#  Tests need Xvfb support before they can be used
RESTRICT="test"

PYTHON_MODNAME="${PN}.py"