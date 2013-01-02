# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# 2.5 is restricted due to except...as syntax
# No 3.x - missing pyrepl
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="Colourful TAB completion for Python prompt"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/pyrepl[${PYTHON_USEDEP}]"

DOCS=(README)
