# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2 python3_3"

inherit jnrowe-pypi

DESCRIPTION="Provides an interactive console for doctests"
HOMEPAGE="https://svn.bluedynamics.eu/svn/public/${PN}/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=""

DOCS=(CHANGELOG.rst README.rst)
