# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# 3.x is not supported because of exception syntax.
PYTHON_COMPAT=(python2_{6,7})

inherit jnrowe-pypi

DESCRIPTION="Sphinx extension to include mscgen's sequence charts"

LICENSE="BOLA"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="pdf"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
# Setuptools is needed in RDEPEND for package namespacing.
RDEPEND="${DEPEND}
	dev-python/sphinx[${PYTHON_USEDEP}]
	media-gfx/mscgen
	pdf? ( dev-texlive/texlive-fontutils )"
