# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils eutils

DESCRIPTION="A helper tool for git that mimics mercurial's serve command"
HOMEPAGE="http://github.com/jezdez/git-serve/"
SRC_URI="http://pypi.python.org/packages/source/${PN:0:1}/${PN}/${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-util/git"

src_install() {
	distutils_src_install

	make_wrapper "${PN}" "python -c 'import gitserve; gitserve.main()'"
}
