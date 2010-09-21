# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="*"

inherit eutils distutils

DESCRIPTION="A python script that converts RSS newsfeeds to email"
HOMEPAGE="http://www.allthingsrss.com/rss2email/"
SRC_URI="http://www.allthingsrss.com/${PN}/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="dev-python/feedparser"

pkg_setup() {
	export SITEDIR="$(python_get_sitedir)"/${PN}
}

src_prepare() {
	epatch "${FILESDIR}"/${PN}-2.66-Resynced-debian-2.65-1.patch
	sed -i "s,/usr/share/rss2email,${SITEDIR}," r2e

	epatch "${FILESDIR}"/${PN}-2.65-r2e-chmod.patch
}

src_compile() {
	:
}

src_install() {
	dobin r2e || die "dobin failed"
	insinto ${SITEDIR}
	doins html2text.py rss2email.py || die "doins failed"
	touch "${D}"/${SITEDIR}/__init__.py || die "touch failed"
	doman r2e.1 || die "doman failed"
	dodoc config.py || die "dodoc failed"
	dohtml readme.html || die "dohtml failed"
}

pkg_postinst() {
	distutils_pkg_postinst
	# rss2email doesn't require a MTA, but the default configuration is set up
	# to use one.
	if [ -z "$(best_version virtual/mta)" ]; then
		einfo "The default installation of rss2email requires a /usr/sbin/sendmail"
		einfo "binary, you may wish to consider mail-mta/msmtp or mail-mta/nbsmtp."
	fi
	einfo "There is an example configuration file, config.py, installed in"
	einfo "/usr/share/doc/${PF}.  Decompress it in ~/.rss2email/ and edit to suit."
}
