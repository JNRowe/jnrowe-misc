# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# Multiprocessing is included in Python since 2.6
PYTHON_COMPAT=(python2_5)

inherit jnrowe-pypi

DESCRIPTION="Offers both local and remote concurrency, by using subprocesses"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="dev-python/setuptools
	doc? ( dev-python/sphinx )"
RDEPEND=""

# Tests are phenomenally broken
RESTRICT="test"

python_compile_all() {
	if use doc; then
		einfo "Generation of documentation"
		sphinx-build -b html Doc Doc_build || die "sphinx-build failed"
	fi
}

python_install_all() {
	if use doc; then
		docinto html
		dohtml -r Doc_build/ || die "HTML installation failed"
	fi
}
