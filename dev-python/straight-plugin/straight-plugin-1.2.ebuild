# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"
MY_PN="${PN/-/.}"

inherit jnrowe-pypi

DESCRIPTION="Simple Python plugin loader inspired by twisted.plugin"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

PYTHON_MODNAME="straight"
