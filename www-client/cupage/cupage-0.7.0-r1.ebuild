# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 2.6 is blocked because of USE=doc dependencies
PYTHON_COMPAT=(python2_7)
GITHUB_TAG=v${PV}
GITHUB_USER="JNRowe"

inherit base jnrowe-github distutils-r1

DESCRIPTION="A tool to check for updates on web pages"
HOMEPAGE="http://jnrowe.github.io/${PN}/"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="dev-python/docutils[${PYTHON_USEDEP}]
	doc? (
		dev-python/cloud_sptheme[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		media-gfx/sphinxcontrib-blockdiag[${PYTHON_USEDEP}]
	)"
RDEPEND="dev-python/blessings[${PYTHON_USEDEP}]
	dev-python/configobj[${PYTHON_USEDEP}]
	dev-python/httplib2[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]"

PATCHES=("${FILESDIR}"/${P}-fix_distribute_entry_point.patch)

DOCS=(NEWS.rst README.rst)

python_compile_all() {
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
