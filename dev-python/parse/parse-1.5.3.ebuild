# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"
DISTUTILS_SRC_TEST="nosetests"
PYPI_OLD_DISTUTILS=1

inherit jnrowe-pypi

DESCRIPTION="Parse using a specification based on the Python format() syntax"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

PYTHON_MODNAME="${PN}.py"
