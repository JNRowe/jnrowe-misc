# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_{6,7})
GITHUB_TAG=v${PV}
GITHUB_USER="JNRowe"

inherit base jnrowe-github distutils-r1

DESCRIPTION="A tool to check for updates on web pages"
HOMEPAGE="http://jnrowe.github.com/${PN}/"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="dev-python/docutils
	doc? (
		dev-python/cloud_sptheme[${PYTHON_USEDEP}]
		dev-python/sphinx
		media-gfx/sphinxcontrib-blockdiag
	)"
RDEPEND="dev-python/blessings[${PYTHON_USEDEP}]
	dev-python/configobj
	dev-python/httplib2
	dev-python/lxml"

PATCHES=("${FILESDIR}"/${P}-fix_distribute_entry_point.patch)

DOCS=(NEWS.rst README.rst)

python_compile_all() {
	distutils-r1_python_compile_all

	if use doc; then
		./setup.py build_sphinx || die "make documentation failed"
		sphinx-build -b man doc doc/.build/man
	fi
}

python_test() {
	nosetests --with-doctest || die "nosetests failed"
}

python_install_all() {
	distutils-r1_python_install_all

	dodoc doc/*.rst || die "dodoc failed"
	if use doc; then
		dohtml -r doc/.build/html/* || die "dohtml failed"
		doman doc/.build/man/${PN}.1 || die "doman failed"
	fi
}
