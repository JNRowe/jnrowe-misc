# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

# 2.5 is restricted due to unavailable dependencies and 2.6+ syntax
# 3.x is restricted due to blessings dependency
PYTHON_COMPAT="python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Simple client for GitHub issues"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

# setuptools is needed for command line wrappers
CDEPEND="dev-python/setuptools"
DEPEND="${CDEPEND}
	doc? (
		dev-python/cloud_sptheme
		dev-python/sphinx
		dev-python/sphinxcontrib-cheeseshop
	)
	test? (
		dev-python/nose
		dev-python/mock
	)"
RDEPEND="${CDEPEND}
	dev-python/argh
	dev-python/blessings
	dev-python/html2text
	>=dev-python/httplib2-0.7.4
	dev-python/jinja
	dev-python/micromodels
	dev-python/pygments"

src_compile() {
	python-distutils-ng_src_compile

	if use doc; then
		./setup.py build_sphinx
	fi
}

python_test() {
	"${PYTHON}" ./setup.py nosetests || die "nosetests failed with ${PYTHON}"
}

python_install_all() {
	if use doc; then
		dohtml -r doc/.build/html/* || die "dohtml failed"
	fi
}
