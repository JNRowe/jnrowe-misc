# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
DISTUTILS_SRC_TEST="nosetests"
DISTUTILS_USE_SEPARATE_SOURCE_DIRECTORIES="1"

inherit distutils

MY_PN="CodeTalker"
MY_P=${MY_PN}-${PV}

DESCRIPTION="A module for dynamic, pythonic language parsing"
HOMEPAGE="http://jaredforsyth.com/projects/codetalker/"
SRC_URI="mirror://pypi/${MY_PN::1}/${MY_PN}/${MY_P}.tar.gz
	http://github.com/jabapyth/codetalker/raw/v1.0/codetalker/c/parser.h -> ${P}-parser.h
	http://github.com/jabapyth/codetalker/raw/v1.0/codetalker/c/_speed_tokens.h -> ${P}-speed_tokens.h"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/cython"
RDEPEND=""

RESTRICT_PYTHON_ABIS="3.*"

S="${WORKDIR}"/${MY_P}

# Tests are currently broken.
RESTRICT="test"

src_prepare() {
	distutils_src_prepare

	prepare() {
		local cdir="${WORKDIR}"/${MY_P}-${PYTHON_ABI}/codetalker/c
		cp "${DISTDIR}"/${P}-parser.h "${cdir}"/parser.h
		cp "${DISTDIR}"/${P}-speed_tokens.h "${cdir}"/_speed_tokens.h
	}

	python_execute_function prepare
}
