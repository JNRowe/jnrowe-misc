# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="A static weblog compiler, using maildirs and reST"
HOMEPAGE="http://www.red-bean.com/decklin/${PN}/"
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
	doins -r contrib/ || die "doins failed"
	if use examples; then
		doins -r examples || die "doins examples failed"
	fi
}
