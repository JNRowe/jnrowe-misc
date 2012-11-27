# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# 2.5 is restricted due to except...as syntax
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_7 python3_1 python3_2 python3_3"

inherit jnrowe-pypi

DESCRIPTION="Colourful TAB completion for Python prompt"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/pyrepl"

DOCS=(README)
