# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is not supported because of exception syntax.
RESTRICT_PYTHON_ABIS="3.*"

inherit jnrowe-pypi

DESCRIPTION="Sphinx extension to include mscgen's sequence charts"

LICENSE="BOLA"
SLOT="0"
KEYWORDS="~amd64"
IUSE="pdf"

DEPEND="dev-python/setuptools"
# Setuptools is needed in RDEPEND for package namespacing.
RDEPEND="${DEPEND}
	dev-python/sphinx
	media-gfx/mscgen
	pdf? ( dev-texlive/texlive-fontutils )"

DOCS="CHANGES"

PYTHON_MODNAME="sphinxcontrib/mscgen.py"
