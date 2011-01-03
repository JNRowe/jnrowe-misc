# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"

inherit jnrowe-pypi

DESCRIPTION="A BDD tool for writing specs using Given-When-Then template"
HOMEPAGE="https://github.com/hugobr/pyhistorian"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/should_dsl
	dev-python/termcolor"

# Files required for tests are missing from archive
RESTRICT="test"
