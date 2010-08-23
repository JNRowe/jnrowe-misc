# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit base eutils toolchain-funcs elisp-common bash-completion

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="git://notmuchmail.org/git/${PN}"
	EGIT_BRANCH="master"
	inherit git
	SRC_URI=""
else
	SRC_URI="http://notmuchmail.org/releases/${P}.tar.gz"
fi

DESCRIPTION="Thread-based email index, search and tagging."
HOMEPAGE="http://notmuchmail.org/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="X debug emacs vim zsh-completion"

RDEPEND="sys-libs/talloc
	>=dev-libs/gmime-2.4
	dev-libs/xapian
	emacs? ( virtual/emacs )
	vim? ( || ( app-editors/vim app-editors/gvim ) )
	zsh-completion? ( app-shells/zsh )"
DEPEND="dev-util/pkgconfig
	debug? ( dev-util/valgrind )
	${RDEPEND}"

SITEFILE="50${PN}-gentoo.el"

DOCS=(AUTHORS NEWS README TODO)

src_prepare() {
	# We'll process the completion stuff manually, as it should be conditional
	sed -i 's,completion ,,' Makefile
}

src_configure() {
	# Handmade configure :/  Works with econf currently, thanks to bunch of code
	# added just to parse common args to configure.
	CC="$(tc-getCC)" CXX="$(tc-getCXX)" econf || die "configure failed"
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
	base_src_install

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		newins completion/notmuch-completion.zsh _notmuch || die "newins failed"
	fi

	dobashcompletion completion/notmuch-completion.bash

	if use emacs; then
		elisp-install ${PN}{,.el{,c}}
		elisp-site-file-install ${SITEFILE}

		if use X; then
			domenu ${PN}.desktop || die "domenu failed"
		fi
	fi

	if use vim; then
		cd vim
		insinto /usr/share/vim/vimfiles/plugin
		doins plugin/${PN}.vim || die "doins plugin failed"
		insinto /usr/share/vim/vimfiles/syntax
		doins syntax/*.vim || die "doins syntax failed"
		newdoc README README.vim || die "dodoc failed"
	fi
}

pkg_postinst() {
	use emacs && elisp-site-regen
	bash-completion_pkg_postinst
}

pkg_postrm() {
	use emacs && elisp-site-regen
}
