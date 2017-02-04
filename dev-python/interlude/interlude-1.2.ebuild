# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=(python{2_7,3_4})

inherit jnrowe-pypi

DESCRIPTION="Provides an interactive console for doctests"
HOMEPAGE="https://svn.bluedynamics.eu/svn/public/${PN}/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""

DOCS=(CHANGELOG.rst README.rst)
