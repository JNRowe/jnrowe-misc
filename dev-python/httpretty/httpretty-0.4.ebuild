# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# 2.5 isn't supported because of socket.create_connection
# 3.x isn't supported because of Unicode literal syntax
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="HTTP client mocking tool for Python"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS=(README.md)

src_unpack() {
	# Broken tarball, with no toplevel directory among other things
	mkdir "${S}"; cd "${S}"
	unpack ${A}
}
