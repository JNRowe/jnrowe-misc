# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils git

EGIT_REPO_URI="git://github.com/baruch/${PN}.git"

DESCRIPTION="A Gtk+ interface to the notmuch mail client."
HOMEPAGE="http://baruch.github.com/${PN}"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/vala
	dev-libs/libgee
	${RDEPEND}"
RDEPEND="x11-libs/gtk+"

src_prepare() {
	local ACFLAGS=(${CFLAGS})
	local VCFLAGS=${ACFLAGS[@]/#/--Xcc=}
	sed -i "s,-g,${VCFLAGS}," Makefile

	epatch "${FILESDIR}"/${P}-path_fixes.patch
}

src_install() {
	dobin ${PN/-/_}
	insinto /usr/share/${PN}
	doins glade/${PN}.glade
}
