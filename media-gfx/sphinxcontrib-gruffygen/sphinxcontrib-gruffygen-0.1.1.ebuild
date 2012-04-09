# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# 3.x is not supported because of exec usage.
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Sphinx extension to support media-gfx/gruffy graphs"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
# Setuptools is needed in RDEPEND for package namespacing.
RDEPEND="${DEPEND}
	dev-python/sphinx
	media-gfx/gruffy"

src_prepare() {
	# README.rst is missing from tarball, it is only used for the description in
	# setuptools so we just use an empty file.
	touch README.rst

	python-distutils-ng_src_prepare
}
