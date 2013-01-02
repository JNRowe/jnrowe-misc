# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# 3.x is not supported because of exception syntax.
PYTHON_COMPAT=(python2_{5..7})

inherit jnrowe-pypi

DESCRIPTION="Sphinx extension to include mscgen's sequence charts"

LICENSE="BOLA"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="pdf"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
# Setuptools is needed in RDEPEND for package namespacing.
RDEPEND="${DEPEND}
	dev-python/sphinx
	media-gfx/mscgen
	pdf? ( dev-texlive/texlive-fontutils )"
