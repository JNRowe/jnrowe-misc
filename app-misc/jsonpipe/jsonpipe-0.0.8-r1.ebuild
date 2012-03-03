# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted due to print syntax, and Unicode literals
RESTRICT_PYTHON_ABIS="3.*"

inherit base jnrowe-pypi

DESCRIPTION="Convert JSON to a UNIX-friendly line-based format"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for entry points usage
# We can't use 2.6's json because we need ordered dictionary support
RDEPEND="${DEPEND}
	|| ( >=dev-lang/python-2.7 dev-python/simplejson )
	|| ( >=dev-lang/python-2.7 dev-python/argparse )
	dev-python/calabash"

PATCHES=("${FILESDIR}"/${P}-use_stdlib_json.patch)

src_prepare() {
	base_src_prepare
	distutils_src_prepare
}
