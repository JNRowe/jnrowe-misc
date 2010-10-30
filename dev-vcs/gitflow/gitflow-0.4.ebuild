# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit base eutils

DESCRIPTION="High-level repository operations for Vincent Driessen's branching model"
HOMEPAGE="http://nvie.com/archives/323"
SRC_URI="http://github.com/nvie/gitflow/tarball/${PV} -> ${P}.tar.gz
	http://github.com/nvie/shFlags/tarball/1.0.3@128 -> shFlags-1.0.3.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-vcs/git"

S="${WORKDIR}"/nvie-${PN}-7cb6151

DOCS=(AUTHORS Changes.mdown README.mdown)

src_prepare() {
	# This really isn't that nice, but the alternative is require git to build
	# the package.
	rm gitflow-shFlags
	cp "${WORKDIR}"/nvie-shFlags-01694f0/src/shflags gitflow-shFlags

	epatch "${FILESDIR}"/${PN}-0.3-path_fixes.patch
}

src_compile() {
	:
}
