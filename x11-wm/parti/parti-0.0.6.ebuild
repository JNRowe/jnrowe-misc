# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

MY_P=${PN}-all-${PV}
DESCRIPTION="Parti is a tabbing/tiling window manager"
HOMEPAGE="http://partiwm.org/"
SRC_URI="${HOMEPAGE}/static/downloads/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-python/pyrex
	dev-util/pkgconfig"
RDEPEND="dev-python/dbus-python
	dev-python/ipython
	dev-python/pygtk"

S="${WORKDIR}"/${MY_P}
