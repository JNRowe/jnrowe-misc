# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# 3.x is restricted due to print syntax
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7"

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
