# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
GITHUB_USER=nvie

inherit base jnrowe-github eutils bash-completion

COMPL_VER="0.4.0"
COMPL_URI="https://github.com/bobthecow/git-flow-completion/tarball/${COMPL_VER}
	-> git-flow-completion-${COMPL_VER}.tar.gz"
COMPL_DIR="bobthecow-git-flow-completion-63fd990"

DESCRIPTION="High-level repository operations for Vincent Driessen's branching model"
HOMEPAGE="http://nvie.com/archives/323"
SRC_URI="${SRC_URI}
	https://github.com/nvie/shFlags/tarball/1.0.3@128 -> shFlags-1.0.3.tar.gz
	bash-completion? ( ${COMPL_URI} )
	zsh-completion? ( ${COMPL_URI} )"

LICENSE="BSD-2 bash-completion? ( MIT ) zsh-completion? ( MIT )"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="zsh-completion"

DEPEND=""
RDEPEND="dev-vcs/git
	zsh-completion? ( app-shells/zsh )"

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

src_install() {
	base_src_install

	pushd "${WORKDIR}"/${COMPL_DIR} >/dev/null
	use bash-completion && dobashcompletion git-flow-completion.bash
	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		newins git-flow-completion.zsh _${PN} || die "zsh newins failed"
	fi
	popd >/dev/null
}
