# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=(python2_{5..7})

inherit jnrowe-pypi

DESCRIPTION="dev-python/sphinx extension to support media-gfx/aafigure"
HOMEPAGE="http://packages.python.org/${PN}/"

LICENSE="BOLA"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is needed in RDEPEND because it installs a setuptools-based plugin
# for docutils.
RDEPEND="${DEPEND}
	>=dev-python/sphinx-0.6"
# aafigure is in PDEPEND to allow working package managers to break the cyclic
# dependency.
PDEPEND=">=media-gfx/aafigure-0.3[${PYTHON_USEDEP}]"

DOCS=(CHANGES README)
