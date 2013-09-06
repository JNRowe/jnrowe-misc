# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_{6,7})

MY_PN="CleverCSS"

inherit jnrowe-pypi

DESCRIPTION="Funky sass-a-like CSS preprocessor"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
# setuptools is required in RDEPEND for entry points
RDEPEND="${DEPEND}"

PATCHES=("${FILESDIR}"/${P}-entry_point.patch)
