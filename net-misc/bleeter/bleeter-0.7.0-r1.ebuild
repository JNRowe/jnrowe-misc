# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.6"
# 2.4 is restricted due to old library names
# 2.5 is restricted due to exception syntax
# 3.x is restricted due to missing dependencies
RESTRICT_PYTHON_ABIS="2.[45] 3.*"
DISTUTILS_SRC_TEST="nosetests"

GITHUB_USER="JNRowe"

inherit jnrowe-github distutils

DESCRIPTION="Nasty little twitter client"
HOMEPAGE="http://jnrowe.github.com/bleeter/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc minimal"

RDEPEND="dev-python/configobj
	dev-python/notify-python
	dev-python/tweepy
	dev-python/pygtk
	!minimal? ( dev-python/termcolor )"
DEPEND="${RDEPEND}
	dev-python/docutils
	doc? ( dev-python/sphinx )"

# Tests require nose features unavailable in the Gentoo nose package.
RESTRICT="test"

src_compile() {
	distutils_src_compile

	rst2man.py doc/${PN}.1.rst doc/${PN}.1 || die "rst2man.py failed"
	if use doc; then
		cd doc
		make html || die "make documentation failed"
	fi
}

src_test() {
	nosetests --with-doctest ${PN}.py
}

src_install() {
	distutils_src_install

	dodoc doc/*.rst || die "dodoc failed"
	doman doc/${PN}.1 || die "doman failed"
	if use doc; then
		dohtml -r doc/.build/html/* || die "dohtml failed"
	fi
}
