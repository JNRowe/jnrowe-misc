# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 3.x is restricted due to use of print syntax
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="Convert HTML to reStructuredText"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
