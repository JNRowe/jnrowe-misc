# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.6"
# 2.5 isn't supported because of socket.create_connection
# 3.x isn't supported because of Unicode literal syntax
RESTRICT_PYTHON_ABIS="2.5 3.*"

inherit jnrowe-pypi

DESCRIPTION="HTTP client mocking tool for Python"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack() {
	# Broken tarball, with no toplevel directory among other things
	mkdir "${S}"; cd "${S}"
	unpack ${A}
}
