# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 3.x isn't supported because of octal syntax
PYTHON_COMPAT=(python2_7)
PYPI_ARCHIVE_SUFFIX="zip"

inherit base jnrowe-pypi

DESCRIPTION="Declarative terminal tool programming"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )"
RDEPEND="dev-python/prettytable[${PYTHON_USEDEP}]
	dev-python/progressbar[${PYTHON_USEDEP}]"

PATCHES=("${FILESDIR}"/${P}-Removed_unused_intersphinx_settings.patch)

DOCS=(README.markdown docs/guide.rst docs/reference.rst)

python_compile_all() {
	if use doc; then
		pushd docs >/dev/null
		make html
		popd >/dev/null
	fi
}

python_install_all() {
	distutils-r1_python_install_all

	if use doc; then
		dohtml -r docs/_build/html/* || die "dohtml failed"
	fi
}
