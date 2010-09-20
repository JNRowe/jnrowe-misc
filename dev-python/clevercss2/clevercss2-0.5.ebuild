# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
DISTUTILS_SRC_TEST="nosetests"

MY_PN="CleverCSS2"
MY_P=${MY_PN}-${PV}

inherit jnrowe-pypi

DESCRIPTION="Python inspired sass-like CSS preprocessor"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools
	test? ( dev-python/codetalker )"
RDEPEND="dev-python/codetalker"

RESTRICT_PYTHON_ABIS="3.*"

S="${WORKDIR}"/${MY_P}

# Tests are currently broken.
RESTRICT="test"
