# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_{6,7},3_{1..3}})

inherit jnrowe-pypi

DESCRIPTION="The next generation of nicer testing for Python"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
# setuptools is required in RDEPEND for entry points
RDEPEND="${DEPEND}
	dev-python/six
	virtual/python-argparse[${PYTHON_USEDEP}]
	virtual/python-unittest2"

PATCHES=("${FILESDIR}"/${PN}-0.4-remote_version_specific_runners.patch)

DOCS=(AUTHORS README.rst)

python_compile_all() {
	distutils-r1_python_compile_all

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
