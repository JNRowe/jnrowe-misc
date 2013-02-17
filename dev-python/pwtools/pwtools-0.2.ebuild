# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# 3.* isn't supported because of relative imports
PYTHON_COMPAT=(python2_{5..7})

inherit distutils-r1

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
	ewarn "Be aware that many of the password quality checks assume US"
	ewarn "keyboards, and will pass obvious passwords on other layouts."
}
