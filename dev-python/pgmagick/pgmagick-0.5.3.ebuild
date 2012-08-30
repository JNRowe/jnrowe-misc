# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

# Incompatible with 3.x
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Yet Another Python wrapper for GraphicsMagick"

SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64 x86"
IUSE=""

RDEPEND="media-gfx/graphicsmagick
	dev-libs/boost[python]"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

# The upstream test runner is incomplete in the released tarball
RESTRICT="test"

DOCS=(README.rst)
