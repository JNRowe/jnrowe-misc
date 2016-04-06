# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 3.x is blocked because of sphinxcontrib-blockdiag dependency
PYTHON_COMPAT=(python2_7)
GITHUB_TAG=v${PV}
GITHUB_USER="JNRowe"

inherit base jnrowe-github distutils-r1

DESCRIPTION="A tool to check for updates on web pages"
HOMEPAGE="https://github.com/JNRowe/${PN}/"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc test"

DEPEND="dev-python/docutils[${PYTHON_USEDEP}]
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		media-gfx/sphinxcontrib-blockdiag[${PYTHON_USEDEP}]
	)
	test? (
		dev-python/expecter[${PYTHON_USEDEP}]
		dev-python/nose2[$PYTHON_USEDEP]
	)"
RDEPEND="dev-python/aaargh[${PYTHON_USEDEP}]
	dev-python/blessings[${PYTHON_USEDEP}]
	dev-python/cssselect[${PYTHON_USEDEP}]
	dev-python/httplib2[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]"

DOCS=(NEWS.rst README.rst)

# Tests are restricted because of unresolvable upstream dependency problems
RESTRICT="test"

python_compile_all() {
	if use doc; then
		./setup.py build_sphinx || die "make documentation failed"
		sphinx-build -b man doc doc/.build/man
	fi
}

python_test() {
	nose2 --with-doctest || die "nosetests failed"
}

python_install_all() {
	distutils-r1_python_install_all

	dodoc doc/*.rst || die "dodoc failed"
	if use doc; then
		dohtml -r doc/.build/html/* || die "dohtml failed"
		doman doc/.build/man/${PN}.1 || die "doman failed"
	fi
}
