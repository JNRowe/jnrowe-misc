# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
# Incompatible with 3.x
RESTRICT_PYTHON_ABIS="3.*"

inherit jnrowe-pypi

DESCRIPTION="Yet Another Python wrapper for GraphicsMagick"

SLOT="0"
LICENSE="MIT"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="media-gfx/graphicsmagick
	dev-libs/boost[python]"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

# The upstream test runner is incomplete in the released tarball
RESTRICT="test"
