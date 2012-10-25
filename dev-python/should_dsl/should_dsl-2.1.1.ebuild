# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2"

inherit jnrowe-pypi

DESCRIPTION="Should assertions in Python as clear and readable as possible"
HOMEPAGE="https://github.com/hugobr/should-dsl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=""

DOCS=(CONTRIBUTORS README.rst)

src_prepare() {
	# Remove the unused Makefile so we don't need to override src_install
	rm Makefile
}
