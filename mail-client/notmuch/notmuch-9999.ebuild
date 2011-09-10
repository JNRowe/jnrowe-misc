# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="python? 2:2.5"
RESTRICT_PYTHON_ABIS="2.4 3.*"
USE_RUBY="ruby18"
RUBY_OPTIONAL="yes"

inherit base distutils eutils toolchain-funcs elisp-common bash-completion-r1 \
	ruby-ng

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="git://notmuchmail.org/git/${PN}"
	inherit git-2
	SRC_URI=""
else
	SRC_URI="http://notmuchmail.org/releases/${P}.tar.gz"
fi

DESCRIPTION="Thread-based email index, search and tagging."
HOMEPAGE="http://notmuchmail.org/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="X debug emacs python ruby vim"

# No go support, this will change when go is added to main tree
# Or alternatively, if a mind-blowing tool which needs the go bindings becomes
# available then the dependency may well be worth carrying in this overlay.
RDEPEND="sys-libs/talloc
	>=dev-libs/gmime-2.4
	dev-libs/xapian
	emacs? ( =virtual/emacs-23 )
	python? ( || ( >=dev-lang/python-2.6 dev-python/simplejson ) )
	ruby? ( $(ruby_implementation_depend ruby18) )
	vim? ( || ( app-editors/vim app-editors/gvim ) )"
DEPEND="dev-util/pkgconfig
	debug? ( dev-util/valgrind )
	${RDEPEND}"

SITEFILE="50${PN}-gentoo.el"

DOCS=(debian/changelog AUTHORS NEWS README TODO)

src_unpack() {
	# Call default explicitly, to avoid ruby-ng's src_unpack.
	if [[ ${PV} == 9999 ]]; then
		git-2_src_unpack
	else
		default
	fi
}

src_prepare() {
	# Remove LDFLAGS overriding
	sed -i '/-Wl,--as-needed/,/^fi$/d' configure
	# Disable bytecode generation, handled better by elisp-compile
	sed -i 's,$(emacs_bytecode),,' emacs/Makefile
}

src_configure() {
	# Handmade configure :/  Works with econf currently, thanks to bunch of code
	# added just to parse common args to configure.  We handle completion
	# ourselves as the build uses the wrong locations, so just disable them
	# here.
	CC="$(tc-getCC)" CXX="$(tc-getCXX)" econf \
		$(use_with emacs) \
		--without-zsh-completion \
		--without-bash-completion \
		|| die "configure failed"
	# Automagic valgrind detection, needs fixing upstream
	use debug || sed -i '/^HAVE_VALGRIND =/s,1,0,' Makefile.config
}

src_compile() {
	emake V=1 || die "emake failed"

	if use emacs; then
		pushd emacs >/dev/null
		elisp-compile *.el || die "elisp-compile failed"
		elisp-make-autoload-file ${SITEFILE}
		popd >/dev/null
	fi

	if use python; then
		pushd bindings/python >/dev/null
		# Ugly, ugly hack to allow python to import notmuch library
		LD_LIBRARY_PATH="$PWD/../../lib" distutils_src_compile
		popd >/dev/null
	fi

	if use ruby; then
		pushd bindings/ruby >/dev/null
		${RUBY:-$(type -p ruby 2>/dev/null)} extconf.rb \
			|| die "\${RUBY} extconf.rb failed"
		emake || die "emake in bindings/ruby failed"
		popd >/dev/null
	fi
}

src_test() {
	# We manually call test here so that we can set V=1
	emake V=1 test || die "emake test failed"
}

src_install() {
	base_src_install

	insinto /usr/share/zsh/site-functions
	newins completion/notmuch-completion.zsh _notmuch || die "newins failed"

	newbashcomp completion/notmuch-completion.bash ${PN}

	if use emacs; then
		pushd emacs >/dev/null
		elisp-install ${PN} *.{el{,c},png}
		elisp-site-file-install ${SITEFILE}
		popd >/dev/null

		if use X; then
			domenu ${PN}.desktop || die "domenu failed"
		fi
	fi

	if use vim; then
		pushd vim >/dev/null
		insinto /usr/share/vim/vimfiles/plugin
		doins plugin/${PN}.vim || die "doins plugin failed"
		insinto /usr/share/vim/vimfiles/syntax
		doins syntax/*.vim || die "doins syntax failed"
		newdoc README README.vim || die "dodoc failed"
		popd >/dev/null
	fi

	if use python; then
		pushd bindings/python >/dev/null
		# Workaround distutils.eclass attempting to reinstall DOCS, caused
		# because it doesn't use namespacing for eclass variables.
		LD_LIBRARY_PATH="$PWD/../../lib" DOCS= distutils_src_install
		popd >/dev/null
	fi

	if use ruby; then
		pushd bindings/ruby >/dev/null
		# doruby doesn't support setting permissions, so we'll just not care
		# about the 644 for now.  The important thing is using it works ;)
		RUBY="${RUBY:-$(type -p ruby 2>/dev/null)}" doruby ${PN}.so \
			|| die "doruby failed"
		popd >/dev/null
	fi
}

pkg_postinst() {
	use emacs && elisp-site-regen
	use python && distutils_pkg_postinst
	ewarn "This package may be dropped soon, now is the time to speak up if use"
	ewarn "it!  The reason is simple: the burden this package carries is way"
	ewarn "too high, and its future isn't as bright as it once seemed(making"
	ewarn "the cost feel even heavier)."
}

pkg_postrm() {
	use emacs && elisp-site-regen
	use python && distutils_pkg_postrm
}
