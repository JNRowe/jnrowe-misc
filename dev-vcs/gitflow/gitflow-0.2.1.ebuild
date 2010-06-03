# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="High-level repository operations for Vincent Driessen's branching model"
HOMEPAGE="http://nvie.com/archives/323"
SRC_URI="http://github.com/nvie/gitflow/tarball/${PV} -> ${P}.tar.gz
	http://github.com/nvie/shFlags/tarball/1.0.3@128 -> shFlags-1.0.3.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}"/nvie-${PN}-5324ecf

src_prepare() {
	rm gitflow-shFlags
	cp "${WORKDIR}"/nvie-shFlags-01694f0/src/shflags gitflow-shFlags

	epatch "${FILESDIR}"/${P}-path_fixes.patch
}

src_compile() {
	:
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README.mdown || die "dodoc failed"
}
