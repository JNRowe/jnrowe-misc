# Copyright 1999-2009 Gentoo Foundation
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
KEYWORDS="~amd64 ~x86"
IUSE="vim-syntax zsh-completion"

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_P}

src_prepare() {
	sed -i 's, -O3,,' configure.ac
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" docdir="/trash" install \
		|| die "make install failed"
	# This is simpler than mangling the Makefile.
	rm -rf "${D}"/trash

	dodoc AUTHORS ChangeLog NEWS README

	dobashcompletion scripts/bash/task_completion.sh ${PN}

	if use vim-syntax; then
		insinto /usr/share/vim/vimfiles/ftdetect
		doins scripts/vim/ftdetect/task.vim
		insinto /usr/share/vim/vimfiles/syntax
		doins scripts/vim/syntax/*.vim
		newdoc scripts/vim/README README.vim
	fi

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins scripts/zsh/_task
	fi
}
