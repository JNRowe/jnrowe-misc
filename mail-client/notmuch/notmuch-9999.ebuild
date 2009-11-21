# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils toolchain-funcs elisp-common bash-completion git

EGIT_REPO_URI="git://notmuchmail.org/git/${PN}"

DESCRIPTION="Thread-based email index, search and tagging."
HOMEPAGE="http://notmuchmail.org/"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="X emacs zsh-completion"

DEPEND="dev-util/pkgconfig
	${RDEPEND}"
RDEPEND="sys-libs/talloc
	dev-libs/gmime
	dev-libs/xapian
	emacs? ( virtual/emacs )
	zsh-completion? ( app-shells/zsh )"

SITEFILE="50${PN}-gentoo.el"

src_compile() {
	emake CC="$(tc-getCC)" CXX="$(tc-getCXX)" CFLAGS="${CFLAGS}" \
		|| die "emake failed"

	if use emacs; then
		elisp-compile ${PN}.el || die "elisp-compile failed"
	fi
}

src_install() {
	emake DESTDIR="${D}" prefix=/usr \
		bash_completion_dir=/usr/share/bash-completion \
		install || die "emake install failed"

	dodoc AUTHORS README TODO

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		newins contrib/notmuch-completion.zsh _notmuch
	fi

	if use emacs; then
		elisp-install ${PN}{,.el{,c}}
		elisp-site-file-install "${FILESDIR}/${SITEFILE}"

		use X && domenu ${PN}.desktop
	fi
}
