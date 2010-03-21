# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="*"
SUPPORT_PYTHON_ABIS="1"

inherit jnrowe-pypi

DESCRIPTION="Colour output plugin for the nose testing framework"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/nose"

# Tests fail to show how rudolf works
RESTRICT="test"

DOCS="CHANGES.txt"

src_test() {
	nosetests
}
