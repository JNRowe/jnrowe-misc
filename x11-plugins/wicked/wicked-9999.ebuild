# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils git-2

EGIT_REPO_URI="git://git.glacicle.com/awesome/${PN}.git"

DESCRIPTION="Widget creation library for x11-wm/awesome"
HOMEPAGE="http://awesome.naquadah.org/wiki/Wicked"
SRC_URI=""

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="x11-wm/awesome"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-fix_empty_data.patch
}

src_install() {
	insinto /usr/share/awesome/lib
	doins wicked.lua || die "doins failed"
	doman ${PN}.7.gz || die "doman failed"
}
