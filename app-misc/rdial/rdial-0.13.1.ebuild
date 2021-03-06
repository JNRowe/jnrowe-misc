# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# Python 3.x is blocked until USE=doc dependencies are updated
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="Simple time tracking for simple people"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

DEPEND="doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinxcontrib-cheeseshop[${PYTHON_USEDEP}]
	)
	test? (
		dev-python/expecter[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/nose2[${PYTHON_USEDEP}]
	)"

RDEPEND="dev-python/aaargh[${PYTHON_USEDEP}]
	dev-python/blessings[${PYTHON_USEDEP}]
	dev-python/prettytable[${PYTHON_USEDEP}]"

python_compile_all() {
	if use doc; then
		python2 ./setup.py build_sphinx || die "make documentation failed"
		/usr/bin/sphinx-build -b man doc doc/.build/man \
			|| die "manpage generation failed"
	fi
}

python_test() {
	nose2 tests || die
}

python_install_all() {
	distutils-r1_python_install_all

	dodoc doc/*.rst || die "dodoc failed"
	if use doc; then
		dohtml -r build/sphinx/html/* || die "dohtml failed"
		doman doc/.build/man/${PN}.1 || die "doman failed"
	fi

	insinto /usr/share/zsh/site-functions
	doins extra/_${PN}
}
