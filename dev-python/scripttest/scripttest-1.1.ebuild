# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="*"
SUPPORT_PYTHON_ABIS="1"

MY_PN="ScriptTest"
MY_P=${MY_PN}-${PV}

inherit jnrowe-pypi

DESCRIPTION="Helper to test command-line scripts"
HOMEPAGE="http://pythonpaste.org/scripttest/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_P}
