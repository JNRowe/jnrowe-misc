# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.6"
# 2.5 is restricted due to source encoding issues
# 3.x is restricted due to Unicode literals
RESTRICT_PYTHON_ABIS="2.5 3.*"

inherit jnrowe-pypi

DESCRIPTION="Assertion toolbox for python"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/ipdb
	dev-python/nose"
