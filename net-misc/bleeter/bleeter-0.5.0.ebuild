# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="2"
DISTUTILS_SRC_TEST="nosetests"

inherit distutils

DESCRIPTION="Nasty little twitter client"
HOMEPAGE="http://jnrowe.github.com/bleeter/"
SRC_URI="http://github.com/JNRowe/bleeter/tarball/${PV} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

RDEPEND="dev-python/configobj
	dev-python/notify-python
	dev-python/tweepy
	|| ( >=dev-lang/python-2.6 dev-python/simplejson )
	|| ( dev-python/pygtk dev-python/imaging )"
DEPEND="${RDEPEND}
	dev-python/docutils
	doc? ( dev-python/sphinx )"

S="${WORKDIR}/JNRowe-${PN}-17ce46a"

src_compile() {
	distutils_src_compile

	rst2man.py ${PN}.1.rst ${PN}.1
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
