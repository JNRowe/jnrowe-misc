# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"

inherit jnrowe-pypi

DESCRIPTION="dev-python/sphinx extension to document HTTP APIs"
HOMEPAGE="http://packages.python.org/sphinxcontrib-httpdomain/"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is needed in RDEPEND because it installs a setuptools-based plugin
# for Sphinx.
RDEPEND="dev-python/setuptools
	>=dev-python/sphinx-1.0"

PYTHON_MODNAME="${PN/-//}.py"

src_prepare() {
	default

	rm -rf sphinxcontrib/autohttp
}
