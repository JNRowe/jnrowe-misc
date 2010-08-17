# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Password generation and security checking"
HOMEPAGE="http://alastairs-place.net/pwtools/"
SRC_URI="${HOMEPAGE}${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="sys-apps/miscfiles"

S="${WORKDIR}"/${PN}

# 3.* isn't supported because of relative imports
RESTRICT_PYTHON_ABIS="3.*"

pkg_postinst() {
	distutils_pkg_postinst
	einfo "Be aware that many of the password quality checks assume US"
	einfo "keyboards, and will pass obvious passwords on other layouts."
}
