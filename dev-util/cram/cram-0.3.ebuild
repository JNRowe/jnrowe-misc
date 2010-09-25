# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"
DISTUTILS_SRC_TEST="setup.py"

inherit base distutils

DESCRIPTION="A simple testing framework for command line applications"
HOMEPAGE="http://bitheap.org/cram/"
SRC_URI="http://bitheap.org/cram/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

DEPEND=""
RDEPEND="${DEPEND}"

PYTHON_MODNAME="${PN}.py"
PATCHES=("${FILESDIR}"/${P}-upstream_fixes.patch)

# Tests are currently broken
RESTRICT="test"

src_prepare() {
	base_src_prepare
	distutils_src_prepare
}

src_install() {
	distutils_src_install

	insinto /usr/share/doc/${PF}
	if use examples; then
		doins -r examples
	fi
}
