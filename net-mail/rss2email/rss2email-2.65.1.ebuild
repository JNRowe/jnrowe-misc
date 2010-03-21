# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="*"
SUPPORT_PYTHON_ABIS="1"

inherit eutils versionator distutils

DEB_REV=$(get_version_component_range 3)
MY_PV=$(get_version_component_range 1-2)

DESCRIPTION="A python script that converts RSS newsfeeds to email"
HOMEPAGE="http://rss2email.infogami.com/"
SRC_URI="mirror://debian/pool/main/${PN::1}/${PN}/${PN}_${MY_PV}.orig.tar.gz
	mirror://debian/pool/main/${PN::1}/${PN}/${PN}_${MY_PV}-${DEB_REV}.diff.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="dev-python/feedparser"

S="${WORKDIR}/${PN}"

pkg_setup() {
	export SITEDIR="$(${python} -c 'from distutils.sysconfig import get_python_lib; print get_python_lib()')"/${PN}
}

src_prepare() {
	epatch "${WORKDIR}"/${PN}_${MY_PV}-${DEB_REV}.diff
	sed -i "s,/usr/share/rss2email,${SITEDIR}," r2e

	epatch "${FILESDIR}"/${PN}-${MY_PV}-r2e-chmod.patch
	epatch "${FILESDIR}"/${PN}-${MY_PV}-X-rss-feed.patch
}

src_compile() {
	:
}

src_install() {
	dobin r2e
	insinto ${SITEDIR}
	doins html2text.py rss2email.py
	touch "${D}"/${SITEDIR}/__init__.py
	doman r2e.1
	dodoc config.py
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
