# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2"
GITHUB_USER="nose-devs"

# We're using the github download because the release on PyPI is broken.
inherit jnrowe-pypi jnrowe-github

DESCRIPTION="The next generation of nicer testing for Python"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for entry points
RDEPEND="${DEPEND}
	dev-python/six
	python_targets_python2_5? ( dev-python/argparse dev-python/unittest2 )
	python_targets_python2_6? ( dev-python/argparse dev-python/unittest2 )"

PATCHES=("${FILESDIR}"/${P}-remote_version_specific_runners.patch
	"${FILESDIR}"/${P}-include_nose2_tools.patch)

DOCS=(AUTHORS NOTES README.rst TODO)

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
