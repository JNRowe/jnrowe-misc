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
CDEPEND="dev-python/setuptools"
DEPEND="${CDEPEND}
	doc? (
		dev-python/cloud_sptheme
		dev-python/sphinx
		dev-python/sphinxcontrib-cheeseshop
	)
	test? (
		dev-python/nose2-cov
		dev-python/mock
	)"
RDEPEND="${CDEPEND}
	dev-python/argh
	dev-python/blessings
	dev-python/html2text
	>=dev-python/httplib2-0.7.4
	dev-python/jinja
	dev-python/kitchen
	dev-python/pygments
	dev-python/schematics"

DOCS=(NEWS.rst README.rst)

src_compile() {
	distutils-r1_src_compile

	if use doc; then
		./setup.py build_sphinx
	fi
}

python_test() {
	# This is here to workaround upstream's cov-core ebuild.  Yeah, *I* hate
	# *me* so much right now.
	[ "${PYTHON##*/}" == python2.6 ] && return
	"${PYTHON}" /usr/bin/nose2 || die "nose2 failed with ${PYTHON}"
}

python_install_all() {
	distutils-r1_python_install_all

	if use doc; then
		dohtml -r doc/.build/html/* || die "dohtml failed"
	fi
}
