# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_7,3_{3,4}})

inherit jnrowe-pypi

DESCRIPTION="The next generation of nicer testing for Python"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )"
# setuptools is required in RDEPEND for entry points
# coverage support is not *really* optional, so we'll force the deps
RDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/cov-core[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]"

PATCHES=("${FILESDIR}"/${P}-remote_version_specific_runners.patch)

DOCS=(AUTHORS README.rst)

python_compile_all() {
	if use doc; then
		python setup.py build_sphinx --build-dir="${WORKDIR}"/sphinx \
			|| die "build_sphinx failed"
	fi
}

python_install_all() {
	distutils-r1_python_install_all

	dodoc -r docs/ || die "dodoc failed"
	dohtml -r "${WORKDIR}"/sphinx/html/ || die "dohtml failed"
}
