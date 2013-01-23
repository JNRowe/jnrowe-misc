# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# Incompatible with 3.x
PYTHON_COMPAT=(python2_{5..7})

inherit jnrowe-pypi

DESCRIPTION="Yet Another Python wrapper for GraphicsMagick"

SLOT="0"
LICENSE="MIT"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="media-gfx/graphicsmagick
	dev-libs/boost[python]"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

# The upstream test runner is incomplete in the released tarball
RESTRICT="test"

DOCS=(README.rst)
