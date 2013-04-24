# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# 2.5 is restricted due to exception syntax
# 2.6 is restricted due to upstream's incorrect termcolor ebuild
# 3.x is restricted due to missing dependencies
PYTHON_COMPAT=(python2_7)

GITHUB_USER="JNRowe"

inherit jnrowe-github distutils-r1

DESCRIPTION="Nasty little twitter client"
HOMEPAGE="http://jnrowe.github.io/${PN}/"
SRC_URI="${SRC_URI}
	doc? ( https://github.com/JNRowe/sphinx-jnrowe/tarball/0.1.0 -> sphinx-jnrowe-0.1.0.tar.gz )"

LICENSE="GPL-3+ doc? ( public-domain )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc minimal"

RDEPEND="dev-python/configobj
	dev-python/notify-python
	dev-python/tweepy
	dev-python/pygtk
	!minimal? (
		dev-python/termcolor[${PYTHON_USEDEP}]
		dev-python/setproctitle
	)"
DEPEND="${RDEPEND}
	dev-python/docutils[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )"

src_unpack() {
	default

	# vcs-snapshot via jnrowe-github doesn't handle this package correctly as we
	# use multiple sources from GitHub.  See c15c71be for more info.
	mv ${GITHUB_USER}-${PN}-*/ "${S}" || die "Moving unpacked tarball failed"

	if use doc; then
		mv "${WORKDIR}"/${GITHUB_USER}-sphinx-jnrowe-*/* "${S}"/doc/jnrowe
	fi
}

python_compile_all() {
	rst2man.py doc/${PN}.1.rst doc/${PN}.1 || die "rst2man.py failed"
	if use doc; then
		cd doc
		make html || die "make documentation failed"
	fi
}

python_install_all() {
	distutils-r1_python_install_all

	dodoc doc/*.rst || die "dodoc failed"
	doman doc/${PN}.1 || die "doman failed"
	if use doc; then
		dohtml -r doc/.build/html/* || die "dohtml failed"
	fi
}
