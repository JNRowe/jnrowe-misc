# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# No python 3 support because of Unicode literals
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="Fuzzy string matching in python"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
