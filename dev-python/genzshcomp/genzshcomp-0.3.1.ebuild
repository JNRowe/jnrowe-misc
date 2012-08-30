# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"
DISTUTILS_SRC_TEST="nosetests"
PYPI_OLD_DISTUTILS=1

inherit jnrowe-pypi

DESCRIPTION="Automatic generation of zsh completion functions"
HOMEPAGE="http://bitbucket.org/hhatto/${PN}/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

# argparse is optional since 0.3, but until there is a better way to express
# suggested dependencies we'll keep the dep for Python <2.7
DEPEND="|| ( dev-python/argparse >=dev-lang/python-2.7 )"
RDEPEND="${DEPEND}"

PYTHON_MODNAME="${PN}.py"
