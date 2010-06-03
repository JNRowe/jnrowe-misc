# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"

inherit distutils versionator

MY_P=${PN}-$(delete_version_separator 2)

DESCRIPTION="Cucumber-ish BDD for python"
HOMEPAGE="http://lettuce.it/"
SRC_URI="http://pypi.python.org/packages/source/${PN::1}/${PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"

RESTRICT_PYTHON_ABIS="2.4 3.*"

S="${WORKDIR}"/${MY_P}

src_unpack() {
	mkdir ${S}; cd ${S}
	unpack ${A}
}
