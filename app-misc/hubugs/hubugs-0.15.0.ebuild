# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# 2.5 is restricted due to unavailable dependencies and 2.6+ syntax
# 3.x is restricted due to blessings dependency
PYTHON_COMPAT=(python2_6 python2_7)

inherit jnrowe-pypi

DESCRIPTION="Simple client for GitHub issues"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

# setuptools is needed for command line wrappers
CDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
DEPEND="${CDEPEND}
	doc? (
		dev-python/cloud_sptheme[${PYTHON_USEDEP}]
		dev-python/sphinx
		dev-python/sphinxcontrib-cheeseshop[${PYTHON_USEDEP}]
	)
	test? (
		dev-python/nose2-cov[${PYTHON_USEDEP}]
		dev-python/mock
	)"
RDEPEND="${CDEPEND}
	dev-python/argh
	dev-python/blessings[${PYTHON_USEDEP}]
	dev-python/html2text
	>=dev-python/httplib2-0.7.4
	dev-python/jinja
	dev-python/kitchen[${PYTHON_USEDEP}]
	dev-python/pygments
	dev-python/schematics[${PYTHON_USEDEP}]"

DOCS=(NEWS.rst README.rst)

src_compile() {
	distutils-r1_src_compile

	if use doc; then
		./setup.py build_sphinx
	fi
}

python_test() {
	"${PYTHON}" /usr/bin/nose2 || die "nose2 failed with ${PYTHON}"
}

python_install_all() {
	distutils-r1_python_install_all

	if use doc; then
		dohtml -r doc/.build/html/* || die "dohtml failed"
	fi
}
