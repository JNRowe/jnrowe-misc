# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_6 python2_7 python3_1 python3_2 python3_3"

inherit jnrowe-pypi

DESCRIPTION="The next generation of nicer testing for Python"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for entry points
RDEPEND="${DEPEND}
	dev-python/six
	python_targets_python2_6? ( dev-python/argparse dev-python/unittest2 )"

PATCHES=("${FILESDIR}"/${PN}-0.4-remote_version_specific_runners.patch)

DOCS=(AUTHORS README.rst)

src_compile() {
	python-distutils-ng_src_compile

	if use doc; then
		pushd docs >/dev/null
		make html
		popd >/dev/null
	fi
}

python_install_all() {
	if use doc; then
		dohtml -r docs/_build/html/* || die "dohtml failed"
	fi
}
