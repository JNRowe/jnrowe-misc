# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
# Incompatible with 3.x
RESTRICT_PYTHON_ABIS="3.*"
# Tests work with nose, but they're basically just import tests.  Enable this if
# the test suite increases.
#DISTUTILS_SRC_TEST="nosetests"

inherit jnrowe-pypi

DESCRIPTION="Yet Another Python wrapper for GraphicsMagick"

SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-gfx/graphicsmagick
	dev-libs/boost[python]"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"
