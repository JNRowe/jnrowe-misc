# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_{5..7})

inherit distutils-r1 readme.gentoo

DESCRIPTION="Accessing Huawei modems in Python, including SMS and data calls."
HOMEPAGE="http://code.google.com/p/${PN}/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="dbus"

DEPEND=""
RDEPEND="dev-python/pyserial
	net-dialup/ppp
	dbus? ( dev-python/dbus-python )"

PATCHES=("${FILESDIR}"/${P}-build_fixes.patch)

python_install_all() {
	distutils-r1_python_install_all

	insinto /etc/ppp/peers/
	doins conf/humod || die "doins failed"
}

src_install() {
	distutils-r1_src_install

	readme.gentoo_src_install
}
