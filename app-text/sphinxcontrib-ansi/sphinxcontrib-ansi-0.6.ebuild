# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.6"
# 2.4 is restricted due to use of context handlers
# 2.5 is restricted due to use of context handlers, without __future__ import
RESTRICT_PYTHON_ABIS="2.[45] 3.*"

inherit jnrowe-pypi

DESCRIPTION="Sphinx extension to convert ANSI colour sequences to coloured HTML output."
HOMEPAGE="http://packages.python.org/sphinxcontrib-ansi/"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is needed in RDEPEND because it installs a setuptools-based plugin
# for Sphinx.
RDEPEND="dev-python/setuptools
	>=dev-python/sphinx-1.0"

PYTHON_MODNAME="${PN/-//}.py"

DOCS="CHANGES.rst"
