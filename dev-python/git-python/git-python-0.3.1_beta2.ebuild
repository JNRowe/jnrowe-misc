# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted due to exception and print syntax
RESTRICT_PYTHON_ABIS="3.*"

# Tests are broken in the current release
#DISTUTILS_SRC_TEST="nosetests"

MY_PN=GitPython
# Can't use versionator here, because of tangled pypi←→versionator chain
MY_PV=${PV/_/-}
MY_P=${MY_PN}-${MY_PV}

inherit jnrowe-pypi versionator

DESCRIPTION="Python Git Library"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

#test? ( dev-python/mock )
DEPEND=""
RDEPEND=">=dev-vcs/gitdb-0.5.1"

S="${WORKDIR}"/${MY_PN}-$(get_version_component_range -3)

PYTHON_MODNAME="git"
