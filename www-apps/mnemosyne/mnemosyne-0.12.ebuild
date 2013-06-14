# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=(python2_{6,7})

inherit distutils-r1

DESCRIPTION="A static weblog compiler, using maildirs and reST"
HOMEPAGE="http://www.red-bean.com/decklin/${PN}/"
SRC_URI="${HOMEPAGE}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND=""
RDEPEND="dev-python/docutils[${PYTHON_USEDEP}]
	dev-python/kid[${PYTHON_USEDEP}]"

python_install_all() {
	distutils-r1_python_install_all

	insinto /usr/share/doc/${PF}
	doins -r contrib/ || die "doins failed"

	if use examples; then
		doins -r examples || die "doins examples failed"
	fi
}
