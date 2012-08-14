# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

# 2.5 is restricted due to source encoding issues
# 3.x is restricted due to Unicode literals
PYTHON_COMPAT="python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Assertion toolbox for python"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/nose"
