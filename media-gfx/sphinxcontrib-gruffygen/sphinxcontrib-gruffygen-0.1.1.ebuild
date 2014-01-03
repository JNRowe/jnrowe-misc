# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# 3.x is not supported because of exec usage.
PYTHON_COMPAT=(python2_{6,7})

inherit jnrowe-pypi

DESCRIPTION="Sphinx extension to support media-gfx/gruffy graphs"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
# Setuptools is needed in RDEPEND for package namespacing.
RDEPEND="${DEPEND}
	dev-python/sphinx[${PYTHON_USEDEP}]
	media-gfx/gruffy[${PYTHON_USEDEP}]"

python_prepare_all() {
	# README.rst is missing from tarball, it is only used for the description in
	# setuptools so we just use an empty file.
	touch README.rst
}
