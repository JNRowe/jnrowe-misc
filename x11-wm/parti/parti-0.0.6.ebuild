# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils

MY_P=${PN}-all-${PV}
DESCRIPTION="Parti is a tabbing/tiling window manager"
HOMEPAGE="http://partiwm.org/"
SRC_URI="${HOMEPAGE}/static/downloads/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/pyrex
	dev-util/pkgconfig"
RDEPEND="dev-python/dbus-python
	dev-python/ipython
	dev-python/pygtk"

S="${WORKDIR}"/${MY_P}

PYTHON_MODNAME="${PN} wimpiggy xpra"

src_install() {
	distutils_src_install

	make_desktop_entry /etc/X11/Sessions/${PN} \
		'Parti is a tabbing/tiling (one might say "partitioning") window manager.' \
		"" # no-icon

	echo -e "#!/bin/sh\n/usr/bin/${PN}" > "${T}/${PN}"
	exeinto /etc/X11/Sessions
	doexe "${T}/${PN}"
}
