# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit toolchain-funcs elisp-common bash-completion git

EGIT_REPO_URI="git://notmuchmail.org/git/${PN}"

DESCRIPTION="Thread-based email index, search and tagging."
HOMEPAGE="http://notmuchmail.org/"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="emacs"

DEPEND="dev-util/pkgconfig
	${RDEPEND}"
RDEPEND="sys-libs/talloc
	dev-libs/gmime
	dev-libs/xapian
	emacs? ( virtual/emacs )"

SITEFILE="50${PN}-gentoo.el"

src_prepare() {
	# Change ordering in case people are using as-needed
	sed -i 's,\($(LDFLAGS)\)\(.*\),\2 \1,' Makefile.local
}

src_compile() {
	emake CC="$(tc-getCC)" CXX="$(tc-getCXX)" CFLAGS="${CFLAGS}" \
		|| die "emake failed"

	if use emacs; then
		elisp-compile ${PN}.el || die "elisp-compile failed"
	fi
}

src_install() {
	# Don't use make install, because it installs compressed man pages,
	# bash-completion in the wrong location and emacs files unconditionally.
	# Three commands are quicker than patching Makefile.local locally.
	dobin ${PN}
	doman ${PN}.1
	dobashcompletion notmuch-completion.bash ${PN}

	dodoc AUTHORS README TODO

	if use emacs; then
		elisp-install ${PN}{,.el}
		elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	fi
}
