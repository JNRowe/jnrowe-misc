# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# <2.7 is restricted until the blockdiag ebuild has support
# 3.x is not supported because of exception syntax.
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="Sphinx extension to support media-gfx/blockdiag diagrams"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
# Setuptools is needed in RDEPEND for package namespacing.
RDEPEND="${DEPEND}
	dev-python/sphinx[${PYTHON_USEDEP}]
	>=media-gfx/blockdiag-1.2.0[${PYTHON_USEDEP}]"

DOCS=(AUTHORS README)
