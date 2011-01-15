# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"
DISTUTILS_SRC_TEST="setup.py"

inherit distutils

DESCRIPTION="A simple testing framework for command line applications"
HOMEPAGE="http://bitheap.org/cram/"
SRC_URI="http://bitheap.org/cram/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples vim-syntax"

DEPEND=""
RDEPEND="${DEPEND}
	vim-syntax? ( || ( app-editors/vim app-editors/gvim ) )"

PYTHON_MODNAME="${PN}.py"

src_install() {
	distutils_src_install

	insinto /usr/share/doc/${PF}
	if use examples; then
		doins -r examples
	fi

	if use vim-syntax; then
		insinto /usr/share/vim/vimfiles/syntax
		doins contrib/${PN}.vim || die "doins syntax failed"
		insinto /usr/share/vim/vimfiles/ftdetect
		doins "${FILESDIR}"/cram.vim || die "doins ftdetect failed"
	fi
}
