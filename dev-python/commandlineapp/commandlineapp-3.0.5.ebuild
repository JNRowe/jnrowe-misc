# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
DISTUTILS_SRC_TEST="nosetests"

inherit distutils

MY_PN="CommandLineApp"
MY_P=${MY_PN}-${PV}

DESCRIPTION="Makes creating appl as simple as defining callbacks to handle options"
HOMEPAGE="http://www.doughellmann.com/projects/CommandLineApp/"
SRC_URI="http://www.doughellmann.com/downloads/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# Should switch to system dev-python/paver when it supports multi-ABI.
DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_P}

RESTRICT_PYTHON_ABIS="3.*"

src_install() {
	distutils_src_install

	dohtml -r docs/
}
