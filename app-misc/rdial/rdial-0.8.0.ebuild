# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# Python 3.{1,2} blocked because of missing fixes in Gentoo's python ebuilds
PYTHON_COMPAT=(python{2_{6,7},3_3})
GITHUB_TAG=v${PV}
GITHUB_USER="JNRowe"

inherit jnrowe-github distutils-r1

DESCRIPTION="Simple time tracking for simple people"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

DEPEND="doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinxcontrib-cheeseshop
	)
	test? (
		dev-python/expecter[${PYTHON_USEDEP}]
		dev-python/mock
		dev-python/nose2-cov[${PYTHON_USEDEP}]
	)"

RDEPEND="dev-python/aaargh[${PYTHON_USEDEP}]
	dev-python/blessings[${PYTHON_USEDEP}]
	dev-python/isodate
	dev-python/prettytable"

python_compile_all() {
	if use doc; then
		python2 ./setup.py build_sphinx || die "make documentation failed"
		python2 /usr/bin/sphinx-build -b man doc doc/.build/man \
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
		dohtml -r doc/.build/html/* || die "dohtml failed"
		doman doc/.build/man/${PN}.1 || die "doman failed"
	fi

	insinto /usr/share/zsh/site-functions
	doins extra/_${PN}
}
