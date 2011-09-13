# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*" #2:2.5"
# 2.4 isn't supported because it depends on stdlib name for etree
# 3.x isn't supported due to StringIO changes
#RESTRICT_PYTHON_ABIS="2.4 3.*"

inherit jnrowe-pypi

DESCRIPTION="nosetests output colourising plugin"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/nose"

PYTHON_MODNAME="${PN}.py"
