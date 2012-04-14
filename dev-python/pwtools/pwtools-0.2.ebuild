# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

# 3.* isn't supported because of relative imports
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit python-distutils-ng

DESCRIPTION="Password generation and security checking"
HOMEPAGE="http://alastairs-place.net/projects/${PN}/"
SRC_URI="mirror://github/JNRowe/jnrowe-misc/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="sys-apps/miscfiles"

S="${WORKDIR}"/${PN}

pkg_postinst() {
	einfo "Be aware that many of the password quality checks assume US"
	einfo "keyboards, and will pass obvious passwords on other layouts."
}
