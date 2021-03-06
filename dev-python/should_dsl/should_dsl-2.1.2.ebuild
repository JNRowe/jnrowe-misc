# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=(python{2_7,3_4})

inherit jnrowe-pypi

DESCRIPTION="Should assertions in Python as clear and readable as possible"
HOMEPAGE="https://github.com/hugobr/should-dsl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""

DOCS=(CONTRIBUTORS README.rst)

src_prepare() {
	# Remove the unused Makefile so we don't need to override src_install
	rm Makefile
}
