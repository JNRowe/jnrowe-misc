# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils toolchain-funcs versionator

MY_P=${PN}-src-$(get_version_component_range 2)

DESCRIPTION="Simple, high-reliability, distributed software configuration management"
HOMEPAGE="http://www.fossil-scm.org/index.html/doc/tip/www/index.wiki"
SRC_URI="http://www.fossil-scm.org/download/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="test"

DEPEND="test? ( dev-lang/tcl )"
RDEPEND=""

S=${WORKDIR}/${MY_P}

src_prepare() {
	sed -i "/^TCC/s,gcc -g -O[2s],$(tc-getCC)," Makefile
	epatch "${FILESDIR}"/${PN}-0.20091220213451-system_sqlite.patch
}

src_install() {
	dobin ${PN}
}
