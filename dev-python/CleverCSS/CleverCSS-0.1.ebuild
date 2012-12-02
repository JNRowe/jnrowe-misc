# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7"

MY_PN="CleverCSS"

inherit jnrowe-pypi

DESCRIPTION="Funky sass-a-like CSS preprocessor"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for entry points
RDEPEND="${DEPEND}"

PATCHES=("${FILESDIR}"/${P}-entry_point.patch)
