# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is not supported because of exec usage.
RESTRICT_PYTHON_ABIS="3.*"

inherit jnrowe-pypi

DESCRIPTION="Sphinx extension to support media-gfx/gruffy graphs"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
# Setuptools is needed in RDEPEND for package namespacing.
RDEPEND="${DEPEND}
	dev-python/sphinx
	media-gfx/gruffy"

PYTHON_MODNAME="sphinxcontrib/gruffygen.py"

src_prepare() {
	distutils_src_prepare

	# README.rst is missing from tarball, it is only used for the description in
	# setuptools so we just use an empty file.
	touch README.rst
}
