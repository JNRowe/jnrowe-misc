# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted due to html2text's unicode usage and exception syntax.
RESTRICT_PYTHON_ABIS="3.*"

inherit eutils distutils

DESCRIPTION="A python script that converts RSS newsfeeds to email"
HOMEPAGE="http://www.allthingsrss.com/rss2email/"
SRC_URI="mirror://gentoo/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/feedparser"

src_prepare() {
	distutils_src_prepare

	epatch "${FILESDIR}"/${PN}-2.66-Resynced-debian-2.65-1.patch
	# Python files installed to sitedir, so fix Debian wrapper.
	sed -i "s,/usr/share/rss2email/rss2email.py,-m ${PN}.${PN}," r2e
	epatch "${FILESDIR}"/${PN}-2.65-r2e-chmod.patch
}

src_compile() {
	:
}

src_install() {
	install_files() {
		local SITEDIR="$(python_get_sitedir)"/${PN}
		insinto ${SITEDIR}
		doins html2text.py rss2email.py || die "doins failed"
		touch "${D}"/${SITEDIR}/__init__.py || die "touch failed"
	}
	python_execute_function install_files

	dobin r2e || die "dobin failed"
	doman r2e.1 || die "doman failed"
	dodoc config.py || die "dodoc failed"
	dohtml readme.html || die "dohtml failed"
}

pkg_postinst() {
	distutils_pkg_postinst
	# rss2email doesn't require a MTA, but the default configuration is set up
	# to use one.
	if [ -z "$(best_version virtual/mta)" ]; then
		einfo "The default installation of rss2email requires"
		einfo "a /usr/sbin/sendmail binary, you may wish to consider"
		einfo "mail-mta/msmtp or mail-mta/nbsmtp."
	fi
	einfo "There is an example configuration file, config.py, installed in"
	einfo "/usr/share/doc/${PF}.  Decompress it in ~/.rss2email/ and edit to"
	einfo "suit."
}
