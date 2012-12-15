# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
# 2.5 is restricted due to context handlers(without __future__ import)
PYTHON_COMPAT=(python{2_{6,7},3_{1,2,3}})

inherit jnrowe-pypi

DESCRIPTION="Formats docstrings to follow PEP 257"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""
