# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted because of print syntax
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="nosetests"

inherit jnrowe-pypi

DESCRIPTION="Automatic generation of zsh completion functions"
HOMEPAGE="http://bitbucket.org/hhatto/${PN}/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# argparse neeeded at build time for imports in setup.py
DEPEND="|| ( dev-python/argparse >=dev-lang/python-2.7 )"
RDEPEND="${DEPEND}"

PYTHON_MODNAME="${PN}.py"
