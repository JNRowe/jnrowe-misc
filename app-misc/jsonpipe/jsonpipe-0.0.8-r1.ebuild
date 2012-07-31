# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

# 3.x is restricted due to print syntax, and Unicode literals
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Convert JSON to a UNIX-friendly line-based format"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for entry points usage
# We can't use 2.6's json because we need ordered dictionary support
RDEPEND="${DEPEND}
	python_targets_python2_6? ( dev-python/simplejson dev-python/argparse )
	dev-python/calabash"

PATCHES=("${FILESDIR}"/${P}-use_stdlib_json.patch)
