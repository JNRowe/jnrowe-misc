# Copyright © 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 2.5 is restricted due to context handlers and io usage
PYTHON_COMPAT=(python{2_{6,7},3_{1..3}})

inherit jnrowe-pypi

DESCRIPTION="Formats docstrings to follow PEP 257"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""