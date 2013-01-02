# Copyright © 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# 3.x is restricted due to print syntax and unicode support
PYTHON_COMPAT=(python2_{5..7})

inherit distutils-r1

DESCRIPTION="Makes your terminal output totally fabulous"
HOMEPAGE="http://lobstertech.com/${PN}.html"
SRC_URI="http://lobstertech.com/media/file/fabulous/fabulous-0.1.5.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="dev-python/setuptools
	doc? ( dev-python/sphinx )"
RDEPEND="dev-python/grapefruit
	dev-python/imaging"

python_compile_all() {
	if use doc; then
		pushd docs >/dev/null
		emake html || die "emake html failed"
		popd >/dev/null
	fi
}

python_install_all() {
	if use doc; then
		dohtml -r docs/_build/html/* || die "dohtml failed"
	fi
}
