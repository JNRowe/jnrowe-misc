# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit autotools versionator

MY_PV=$(get_major_version)
PATCHLEVEL=$(get_after_major_version)

DESCRIPTION="Library that disables all forms of writing data safely to disk"
HOMEPAGE="http://www.flamingspork.com/projects/libeatmydata/"
SRC_URI="mirror://debian/pool/main/${PN::4}/${PN}/${PN}_${MY_PV}.orig.tar.bz2
	mirror://debian/pool/main/${PN::4}/${PN}/${PN}_${MY_PV}-${PATCHLEVEL}.debian.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}-${MY_PV}

src_prepare() {
	eautoreconf

	# We install library directly to /usr/lib, so fix path
	sed -i 's,/usr/lib/libeatmydata/,/usr/lib/,' \
		"${WORKDIR}"/debian/lib/eatmydata.sh
}

src_compile() {
	emake CC="$(tc-getCC)" || die "emake failed"
}

src_test() {
	if has usersandbox ${FEATURES}; then
		ewarn "Two tests will fail with FEATURES=usersandbox, test failures"
		ewarn "will be ignored with usersandbox!!!"
	fi
	emake CC="$(tc-getCC)" test
	if [[ $? != 0 ]] && ! has usersandbox ${FEATURES}; then
		die "testsuite failed!"
	fi
}

src_install() {
	dobin "${WORKDIR}"/debian/bin/eatmydata || die "dobin eatmydata failed"
	dolib ${PN}.so
	doman "${WORKDIR}"/debian/eatmydata.1 || die "doman eatmydata.1 failed"
	insinto /usr/share/${PN}
	doins "${WORKDIR}"/debian/lib/eatmydata.sh \
		|| die "doins eatmydata.sh failed"
}

pkg_postinst() {
	ewarn "This package is called *eat* *my* *data* for a reason, don't use it"
	ewarn "unless you want to trash your data!"
}
