# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils

DESCRIPTION="Accessing Huawei modems in Python, including SMS and data calls."
HOMEPAGE="http://code.google.com/p/pyhumod/"
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

src_prepare() {
	sed -i -e '/^CONFIG_FILES/,/^$/d' -e '/CONFIG_FILES/d' setup.py
}

src_install() {
	distutils_src_install

	insinto /etc/ppp/peers/
	doins conf/humod
}

pkg_postinst() {
	distutils_pkg_postinst

	if ! use dbus; then
		elog "dbus support is required for modem detection.  Either rebuild with"
		elog "USE=dbus or manually install dev-python/dbus-python."
	fi
}
