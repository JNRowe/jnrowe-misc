# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

# 3.x is restricted due to print syntax
PYTHON_COMPAT="python2_5 python2_6 python2_7"

MY_PN="Charty"

inherit jnrowe-pypi

DESCRIPTION="Another Python SVG Chart Generator that uses CSS smartly"

LICENSE="BSD GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

PATCHES=("${FILESDIR}"/${P}-include_css.patch \
	"${FILESDIR}"/${P}-fix_example.patch)

DOCS=(CHANGES.txt README)
