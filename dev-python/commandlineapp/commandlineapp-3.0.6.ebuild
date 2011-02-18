# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="nosetests"

inherit distutils

MY_PN="CommandLineApp"
MY_P=${MY_PN}-${PV}

DESCRIPTION="Makes creating apps as simple as defining callbacks to handle options"
HOMEPAGE="http://www.doughellmann.com/projects/CommandLineApp/"
SRC_URI="http://www.doughellmann.com/downloads/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

# Should switch to system dev-python/paver when it supports multi-ABI.
DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_P}

PYTHON_MODNAME="${PN}.py"

src_install() {
	distutils_src_install

	dohtml -r docs/
}
