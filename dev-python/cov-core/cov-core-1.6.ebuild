# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2"

inherit jnrowe-pypi

DESCRIPTION="Plugin core for use by pytest-cov, nose-cov and nose2-cov"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/coverage"

PATCHES=("${FILESDIR}"/${P}-fix_subprocess_hack_install.patch)

DOCS=(README.txt)

src_install() {
	default

	DESTDIR="${D}" python-distutils-ng_src_install
}
