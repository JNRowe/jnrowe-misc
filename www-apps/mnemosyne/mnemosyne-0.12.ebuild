# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils

DESCRIPTION="A static weblog compiler, using maildirs and reST"
HOMEPAGE="http://www.red-bean.com/decklin/mnemosyne/"
SRC_URI="${HOMEPAGE}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND=""
RDEPEND="dev-python/docutils
	dev-python/kid"

src_install() {
	distutils_src_install

	insinto /usr/share/doc/${PF}
	doins -r contrib/
	use examples && doins -r examples
}
