# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="nosetests"
PYPI_OLD_DISTUTILS=1

inherit jnrowe-pypi

DESCRIPTION="A library for building flexible Python command line interfaces"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools
	test? ( dev-python/py )"
RDEPEND="dev-python/pyrepl"

DOCS="CHANGES CREDITS"

src_install() {
	distutils_src_install

	dohtml ${PN}.html || die "dohtml failed"
}
