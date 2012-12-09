# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=(python2_5 python2_6 python2_7 python3_1 python3_2 python3_3)

inherit jnrowe-pypi

DESCRIPTION="Should assertions in Python as clear and readable as possible"
HOMEPAGE="https://github.com/hugobr/should-dsl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""

DOCS=(CONTRIBUTORS README.rst)

src_prepare() {
	# Remove the unused Makefile so we don't need to override src_install
	rm Makefile
}
