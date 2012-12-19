# Copyright © 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python2_{5,6,7})

inherit distutils-r1

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

python_prepare_all() {
	sed -i -e '/^CONFIG_FILES/,/^$/d' -e '/CONFIG_FILES/d' setup.py
}

python_install_all() {
	insinto /etc/ppp/peers/
	doins conf/humod || die "doins failed"
}

pkg_postinst() {
	if ! use dbus; then
		elog "dbus support is required for automatic modem detection.  Either "
		elog "rebuild with USE=dbus or manually install "
		elog "dev-python/dbus-python."[${PYTHON_USEDEP}]
	fi
}
