# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="dev-python/sphinx extension to support media-gfx/aafigure"
HOMEPAGE="http://packages.python.org/sphinxcontrib-aafig/"
SRC_URI="http://pypi.python.org/packages/source/${PN::1}/${PN}/${P}.tar.gz"

LICENSE="BOLA"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is needed in RDEPEND because it installs a setuptools-based plugin
# for docutils.
RDEPEND="dev-python/setuptools
	>=dev-python/sphinx-0.6
	>=media-gfx/aafigure-0.3"

