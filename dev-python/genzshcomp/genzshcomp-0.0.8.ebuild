# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.6"
RESTRICT_PYTHON_ABIS="2.[45] 3.*"
DISTUTILS_SRC_TEST="nosetests"

inherit jnrowe-pypi

DESCRIPTION="Automatic generation of zsh completion functions"
HOMEPAGE="http://bitbucket.org/hhatto/genzshcomp/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
