# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_COMPAT="python2_5 python2_6 python2_7"

MY_PN="CleverCSS"

inherit base jnrowe-pypi

DESCRIPTION="Funky sass-a-like CSS preprocessor"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for entry points
RDEPEND="${DEPEND}"

PATCHES=("${FILESDIR}"/${P}-entry_point.patch)

src_prepare() {
	base_src_prepare

	python-distutils-ng_src_prepare
}

python_install_all() {
	python-distutils-ng_redoscript "/usr/bin/${PN}"
}
