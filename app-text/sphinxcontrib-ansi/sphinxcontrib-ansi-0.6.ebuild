# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# 2.5 is restricted due to use of context handlers, without __future__ import
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Sphinx extension to convert ANSI colour sequences to coloured HTML output."
HOMEPAGE="http://packages.python.org/${PN}/"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is needed in RDEPEND because it installs a setuptools-based plugin
# for Sphinx.
RDEPEND="dev-python/setuptools
	>=dev-python/sphinx-1.0"

DOCS=(CHANGES.rst README)
