# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

# 2.5 is restricted due to exception syntax
# 3.x is restricted due to missing dependencies
PYTHON_COMPAT="python2_6 python2_7"

GITHUB_USER="JNRowe"

inherit jnrowe-github python-distutils-ng

DESCRIPTION="Nasty little twitter client"
HOMEPAGE="http://jnrowe.github.com/${PN}/"
SRC_URI="${SRC_URI}
	doc? ( https://github.com/JNRowe/sphinx-jnrowe/tarball/0.1.0 -> sphinx-jnrowe-0.1.0.tar.gz )"

LICENSE="GPL-3 doc? ( public-domain )"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc minimal"

RDEPEND="dev-python/configobj
	dev-python/notify-python
	dev-python/tweepy
	dev-python/pygtk
	!minimal? (
		dev-python/termcolor
		dev-python/setproctitle
	)"
DEPEND="${RDEPEND}
	dev-python/docutils
	doc? ( dev-python/sphinx )"

src_unpack() {
	default

	# vcs-snapshot via jnrowe-github doesn't handle this package correctly as we
	# use multiple sources from GitHub.  See
	# c15c71be7e79aa144367dd0d5b801b212f112b8e for more info.
	mv ${GITHUB_USER}-${PN}-*/ "${S}" || die "Moving unpacked tarball failed"

	if use doc; then
		mv "${WORKDIR}"/JNRowe-sphinx-jnrowe-c071fd6/* "${S}"/doc/jnrowe
	fi
}

src_compile() {
	python-distutils-ng_src_compile

	rst2man.py doc/${PN}.1.rst doc/${PN}.1 || die "rst2man.py failed"
	if use doc; then
		cd doc
		make html || die "make documentation failed"
	fi
}

python_install_all() {
	dodoc doc/*.rst || die "dodoc failed"
	doman doc/${PN}.1 || die "doman failed"
	if use doc; then
		dohtml -r doc/.build/html/* || die "dohtml failed"
	fi
}
