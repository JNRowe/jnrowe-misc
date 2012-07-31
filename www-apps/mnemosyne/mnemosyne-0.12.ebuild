# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit python-distutils-ng

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

DOCS=(NEWS README)

python_install_all() {
	insinto /usr/share/doc/${PF}
	doins -r contrib/ || die "doins failed"

	if use examples; then
		doins -r examples || die "doins examples failed"
	fi
}

src_install() {
	default

	python-distutils-ng_src_install
}
