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
IUSE="X debug emacs vim zsh-completion"

DEPEND="dev-util/pkgconfig
	debug? ( dev-util/valgrind )
	${RDEPEND}"
RDEPEND="sys-libs/talloc
	dev-libs/gmime:2.4
	dev-libs/xapian
	emacs? ( virtual/emacs )
	vim? ( || ( app-editors/vim app-editors/gvim ) )
	zsh-completion? ( app-shells/zsh )"

SITEFILE="50${PN}-gentoo.el"

src_configure() {
	# Handmade configure :/
	CC="$(tc-getCC)" CXX="$(tc-getCXX)" ./configure --prefix=/usr \
		|| die "econf failed"
	# Automagic valgrind detection, needs fixing upstream
	use debug || sed -i '/^HAVE_VALGRIND =/s,1,0,' Makefile.config
}

src_compile() {
	emake V=1 || die "emake failed"

	if use emacs; then
		elisp-compile ${PN}.el || die "elisp-compile failed"
		elisp-make-autoload-file ${SITEFILE}
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc AUTHORS README TODO

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		newins contrib/notmuch-completion.zsh _notmuch
	fi

	dobashcompletion contrib/notmuch-completion.bash

	if use emacs; then
		elisp-install ${PN}{,.el{,c}}
		elisp-site-file-install ${SITEFILE}

		use X && domenu ${PN}.desktop
	fi

	if use vim; then
		cd vim
		insinto /usr/share/vim/vimfiles/plugin
		doins plugin/${PN}.vim
		insinto /usr/share/vim/vimfiles/syntax
		doins syntax/*.vim
		newdoc README README.vim
	fi
}

pkg_postinst() {
	use emacs && elisp-site-regen
	bash-completion_pkg_postinst
}

pkg_postrm() {
	use emacs && elisp-site-regen
}
