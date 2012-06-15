# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

GITHUB_USER=nvie

inherit jnrowe-github eutils bash-completion-r1

COMPL_VER="0.4.0"
COMPL_URI="https://github.com/bobthecow/git-flow-completion/tarball/${COMPL_VER}
	-> git-flow-completion-${COMPL_VER}.tar.gz"

DESCRIPTION="High-level repository operations for Vincent Driessen's branching model"
HOMEPAGE="http://nvie.com/archives/323"
SRC_URI="${SRC_URI}
	${COMPL_URI}"

LICENSE="BSD-2 MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-util/shflags
	dev-vcs/git"

DOCS=(AUTHORS Changes.mdown README.mdown)

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0.3-path_fixes.patch
	epatch "${FILESDIR}"/${P}-system_shflags.patch
}

src_compile() {
	:
}

src_install() {
	default

	pushd "${WORKDIR}"/git-flow-completion-${COMPL_VER} >/dev/null
	newbashcomp git-flow-completion.bash ${PN}
	insinto /usr/share/zsh/site-functions
	newins git-flow-completion.zsh _${PN}
	popd >/dev/null
}
