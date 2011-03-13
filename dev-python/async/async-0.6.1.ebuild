# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted due to print syntax
RESTRICT_PYTHON_ABIS="3.*"
# Tests are broken because of optional extension module
#DISTUTILS_SRC_TEST="nosetests"

inherit jnrowe-pypi

DESCRIPTION="A framework to process interdependent tasks in a pool of workers"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
