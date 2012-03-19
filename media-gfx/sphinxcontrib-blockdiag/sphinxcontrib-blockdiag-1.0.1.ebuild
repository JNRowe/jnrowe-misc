# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.7"
# <2.7 is restricted until the blockdiag ebuild has support
# 3.x is not supported because of exception syntax.
RESTRICT_PYTHON_ABIS="2.[56] 3.*"

inherit jnrowe-pypi

DESCRIPTION="Sphinx extension to support media-gfx/blockdiag diagrams"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
# Setuptools is needed in RDEPEND for package namespacing.
RDEPEND="${DEPEND}
	dev-python/sphinx
	>=media-gfx/blockdiag-1.1.0"

PYTHON_MODNAME="${PN/-//}.py"
