# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# <2.7 is restricted until the blockdiag ebuild has support
# 3.x is not supported because of exception syntax.
PYTHON_COMPAT="python2_7"

inherit jnrowe-pypi

DESCRIPTION="Sphinx extension to support media-gfx/blockdiag diagrams"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
# Setuptools is needed in RDEPEND for package namespacing.
RDEPEND="${DEPEND}
	dev-python/sphinx
	>=media-gfx/blockdiag-1.1.0"

DOCS=(AUTHORS README)
