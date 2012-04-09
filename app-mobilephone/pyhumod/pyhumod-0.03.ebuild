# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit python-distutils-ng

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

PYTHON_MODNAME="humod"

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
		elog "dev-python/dbus-python."
	fi
}
