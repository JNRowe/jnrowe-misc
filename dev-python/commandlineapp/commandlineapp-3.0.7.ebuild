# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="nosetests"
PYPI_OLD_DISTUTILS=1

MY_PN="CommandLineApp"

inherit jnrowe-pypi

DESCRIPTION="Makes creating apps as simple as defining callbacks to handle options"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# Should switch to system dev-python/paver when it supports multi-ABI.
DEPEND=""
RDEPEND="${DEPEND}"

PYTHON_MODNAME="${PN}.py"

src_install() {
	distutils_src_install

	dohtml -r docs/build/html/
}
