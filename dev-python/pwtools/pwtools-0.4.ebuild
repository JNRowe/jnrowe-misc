# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 3.* isn't supported because of relative imports
PYTHON_COMPAT=(python2_{6,7})

inherit jnrowe-pypi

DESCRIPTION="Password generation and security checking"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="sys-apps/miscfiles"

pkg_postinst() {
	ewarn "Be aware that many of the password quality checks assume US"
	ewarn "keyboards, and will pass obvious passwords on other layouts."
}
