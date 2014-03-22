# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_{6,7},3_{2,3}})

inherit jnrowe-pypi

DESCRIPTION="Modules for working with points on Earth"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE="doc test"

DEPEND="doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )"
# Test deps once upstream is fixed
#	test? (
# 		dev-python/expecter[${PYTHON_USEDEP}]
# 		dev-python/mock[${PYTHON_USEDEP}]
# 		dev-python/nose2-cov[${PYTHON_USEDEP}]
# 	)
RDEPEND="dev-python/aaargh[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]"

# Restrict tests due to upstream dependency problems
RESTRICT="test"

PATCHES=("${FILESDIR}"/${P}-fix_python3.patch)

DOCS=(CONTRIBUTING.rst NEWS.rst README.rst)

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
	doins extra/_edist
}
