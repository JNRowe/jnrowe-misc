# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git

EGIT_REPO_URI="http://git.sysphere.org/${PN}"

DESCRIPTION="vicious widgets for the awesome window manager"
HOMEPAGE="http://awesome.naquadah.org/wiki/Vicious"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="x11-wm/awesome"

src_install() {
	insinto /usr/share/awesome/lib/${PN}
	doins *.lua

	dodoc CHANGES README
}
