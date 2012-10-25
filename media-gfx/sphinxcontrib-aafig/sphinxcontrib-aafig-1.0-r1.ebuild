# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7"

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
PDEPEND=">=media-gfx/aafigure-0.3"

DOCS=(CHANGES README)
