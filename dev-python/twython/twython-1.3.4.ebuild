# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"

inherit base jnrowe-pypi

DESCRIPTION="An easy (and up to date) way to access Twitter data with Python."

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND="dev-python/setuptools"
RDEPEND="|| ( >=dev-lang/python-2.6 dev-python/simplejson )
	dev-python/oauth2"

PATCHES=("${FILESDIR}"/${P}-build_fixes.patch)

src_prepare() {
	base_src_prepare
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
