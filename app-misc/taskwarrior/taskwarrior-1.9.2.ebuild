# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools bash-completion

MY_P=task-${PV}
DESCRIPTION="A GTD, todo list, task management, command line utility"
HOMEPAGE="http://taskwarrior.org/projects/show/taskwarrior/"
SRC_URI="http://taskwarrior.org/download/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="nls vim-syntax zsh-completion"

DEPEND="dev-lang/lua"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_P}

src_prepare() {
	sed -i 's,-pedantic -O3,,' configure.ac
	eautoreconf
}

src_install() {
	# This is simpler than mangling the Makefile for the broken doc path.
	emake DESTDIR="${D}" docdir="/trash" install \
		|| die "make install failed"
	rm -rf "${D}"/trash

	dodoc AUTHORS ChangeLog NEWS README || die "dodoc failed"

	dobashcompletion scripts/bash/task_completion.sh ${PN}

	if use vim-syntax; then
		insinto /usr/share/vim/vimfiles/ftdetect
		doins scripts/vim/ftdetect/task.vim || die "doins ftdetect failed"
		insinto /usr/share/vim/vimfiles/syntax
		doins scripts/vim/syntax/*.vim || die "doins syntax failed"
		newdoc scripts/vim/README README.vim || die "newdoc failed"
	fi

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins scripts/zsh/_task || die "doins zsh failed"
	fi

	if use nls; then
		insinto /usr/share/${PN}/locale
		doins i18n/*
	fi

	docinto rc
	dodoc doc/rc/*
}

pkg_postinst() {
	use nls && einfo "Locale files are installed to /usr/share/${PN}/locale"
}
