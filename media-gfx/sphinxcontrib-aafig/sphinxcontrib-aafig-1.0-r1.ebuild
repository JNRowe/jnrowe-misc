# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"

inherit jnrowe-pypi

DESCRIPTION="dev-python/sphinx extension to support media-gfx/aafigure"
HOMEPAGE="http://packages.python.org/sphinxcontrib-aafig/"

LICENSE="BOLA"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is needed in RDEPEND because it installs a setuptools-based plugin
# for docutils.
RDEPEND="dev-python/setuptools
	>=dev-python/sphinx-0.6"
# aafigure is in PDEPEND to allow working package managers to break the cyclic
# dependency.
PDEPEND=">=media-gfx/aafigure-0.3"

PYTHON_MODNAME="${PN/-//}.py"
