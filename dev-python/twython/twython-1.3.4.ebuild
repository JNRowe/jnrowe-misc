# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# This package supports Python 3, but working around distutils eclass to
# support it is far too much effort for far too little gain.  If you
# would like to see Python 3 support for twython open a bug.
RESTRICT_PYTHON_ABIS="3.*"

inherit jnrowe-pypi

DESCRIPTION="An easy (and up to date) way to access Twitter data with Python."

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND="dev-python/setuptools"
RDEPEND="|| ( >=dev-lang/python-2.6 dev-python/simplejson )
	dev-python/oauth2"

src_prepare() {
	# Duplicate from README.markdown
	rm "${S}"/README.txt || die "rm README.txt failed"
	distutils_src_prepare
}

src_install() {
	distutils_src_install

	insinto /usr/share/doc/${PF}
	if use examples; then
		doins -r oauth_django_example
	fi
}
