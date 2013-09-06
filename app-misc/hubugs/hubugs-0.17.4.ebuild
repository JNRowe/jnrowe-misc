# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 2.6 is restricted due to incorrect upstream cov-core ebuild
# 3.x is restricted due to blessings dependency
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="Simple client for GitHub issues"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc test"

# setuptools is needed for command line wrappers
CDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
DEPEND="${CDEPEND}
	doc? (
		dev-python/cloud_sptheme[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinxcontrib-cheeseshop[${PYTHON_USEDEP}]
	)
	test? (
		dev-python/nose2-cov[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
	)"
RDEPEND="${CDEPEND}
	dev-python/aaargh[${PYTHON_USEDEP}]
	dev-python/blessings[${PYTHON_USEDEP}]
	dev-python/html2text[${PYTHON_USEDEP}]
	>=dev-python/httplib2-0.7.4[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]"

DOCS=(CONTRIBUTING.rst NEWS.rst README.rst)

# Currently broken when using portage
RESTRICT="test"

python_compile_all() {
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
		dohtml -r build/sphinx/html/* || die "dohtml failed"
	fi

	insinto /usr/share/zsh/site-functions
	doins extra/_hubugs
}
