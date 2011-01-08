# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit base autotools versionator

MY_PV=$(get_major_version)
PATCHLEVEL=$(get_after_major_version)

DESCRIPTION="Library that disables all forms of writing data safely to disk."
HOMEPAGE="http://www.flamingspork.com/projects/libeatmydata/"
SRC_URI="mirror://debian/pool/main/${PN::4}/${PN}/${PN}_${MY_PV}.orig.tar.gz
	mirror://debian/pool/main/${PN::4}/${PN}/${PN}_${MY_PV}-${PATCHLEVEL}.debian.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

# From debian/patches/series, as we can't depend on quilt on our systems
PATCHES=("${WORKDIR}"/debian/patches/upstream_basic_autoconf.diff
	"${WORKDIR}"/debian/patches/upstream_improve_Makefile.diff
	"${WORKDIR}"/debian/patches/upstream_portable_testsuite.diff
	"${WORKDIR}"/debian/patches/upstream_handle_va_arg_promotion.diff
	"${FILESDIR}"/${P}-fix_testsuite_open_usage.patch
)

S="${WORKDIR}"/${PN}-${MY_PV}

src_prepare() {
	base_src_prepare

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
