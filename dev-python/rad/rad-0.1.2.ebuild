# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.6"
# 2.4 is restricted due to relative imports and except...as syntax
# 2.5 is restricted due to except...as syntax
# 3.x is restricted due to print command
RESTRICT_PYTHON_ABIS="2.[45] 3.*"

inherit jnrowe-pypi

DESCRIPTION="A super easy console highlighter.  Text goes in, colour comes out."

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/colorama
	dev-python/plac
	dev-python/pyyaml"
