# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"
# 2.4 isn't supported because of  use of functools, and...
# 2.5 isn't supported because of socket.create_connection
# 3.x isn't supported because of Unicode literal syntax
#RESTRICT_PYTHON_ABIS="2.[45] 3.*"
MY_PN="${PN/-/.}"

inherit jnrowe-pypi

DESCRIPTION="Simple Python plugin loader inspired by twisted.plugin"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

PYTHON_MODNAME="straight"
