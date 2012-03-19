# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted due to print syntax
RESTRICT_PYTHON_ABIS="3.*"

MY_PN="Charty"

inherit base jnrowe-pypi

DESCRIPTION="Another Python SVG Chart Generator that uses CSS smartly"

LICENSE="BSD GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

PATCHES=("${FILESDIR}"/${P}-include_css.patch "${FILESDIR}"/${P}-fix_example.patch)

src_prepare() {
	base_src_prepare
	distutils_src_prepare
}
