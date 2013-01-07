# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_{5..7},3_{1..3}})

inherit jnrowe-pypi

DESCRIPTION="Bash-style pipelining syntax for Python generators"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"
