# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_{5..7})

inherit jnrowe-pypi

DESCRIPTION="Makes creating apps as simple as defining callbacks to handle options"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/paver[${PYTHON_USEDEP}]"
RDEPEND=""

HTML_DOCS=(docs/build/html/)

src_prepare() {
	# Use system paver, /slightly/ better feeling
	rm paver-minilib.zip

	distutils-r1_src_prepare
}

python_test() {
	nosetests || die
}
