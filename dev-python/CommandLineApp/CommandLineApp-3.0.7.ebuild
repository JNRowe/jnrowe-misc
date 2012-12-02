# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="nosetests"
PYPI_OLD_DISTUTILS=1

inherit jnrowe-pypi

DESCRIPTION="Makes creating apps as simple as defining callbacks to handle options"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# Should switch to system dev-python/paver when it supports multi-ABI.
DEPEND=""
RDEPEND="${DEPEND}"

PYTHON_MODNAME="commandlineapp.py"

src_install() {
	distutils_src_install

	dohtml -r docs/build/html/
}
