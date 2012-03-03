# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"
DISTUTILS_SRC_TEST="nosetests"

inherit jnrowe-pypi

DESCRIPTION="Parse using a specification based on the Python format() syntax"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

PYTHON_MODNAME="${PN}.py"
