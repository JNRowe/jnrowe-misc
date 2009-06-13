# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git

EGIT_REPO_URI="git://git.glacicle.com/awesome/${PN}.git"

DESCRIPTION="Widget creation library for x11-wm/awesome"
HOMEPAGE="http://awesome.naquadah.org/wiki/Wicked"
SRC_URI=""

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="x11-wm/awesome"

src_install() {
	insinto /usr/share/awesome/lib
	doins wicked.lua
	doman ${PN}.7.gz
}
