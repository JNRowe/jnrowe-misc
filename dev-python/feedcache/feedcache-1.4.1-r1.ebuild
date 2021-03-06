# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="Wrapper for the Universal Feed Parser which caches the results"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )"
RDEPEND="dev-python/feedparser[${PYTHON_USEDEP}]"

DOCS=(README.txt)

python_compile_all() {
	if use doc; then
		# The tarball is missing files needed for a complete doc build, but
		# *some* docs are better than nothing.
		python ./setup.py build_sphinx || die "build_sphinx failed"
	fi
}

python_install_all() {
	distutils-r1_python_install_all

	if use doc; then
		dohtml -r build/sphinx/html/
	fi
}
