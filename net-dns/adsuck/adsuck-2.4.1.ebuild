# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit base toolchain-funcs user

DESCRIPTION="Small DNS server that spoofs blacklisted addresses"
HOMEPAGE="https://opensource.conformal.com/wiki/adsuck"
SRC_URI="https://opensource.conformal.com/snapshots/${PN}/${P}.tgz"

KEYWORDS="~amd64"
SLOT="0"
LICENSE="as-is"
IUSE=""

DEPEND="dev-libs/libevent
	net-libs/ldns"
RDEPEND="${DEPEND}"

PATCHES=("${FILESDIR}"/${P}-build_env.patch)

src_compile() {
	emake CC="$(tc-getCC)" ${PN}
}

src_install() {
	dobin ${PN}
	doman ${PN}.8

	insinto /var/lib/${PN}
	doins files/{Hosts.pub,hosts.small}

	insinto /usr/share/doc/${PF}/examples
	doins files/*
}

pkg_preinst() {
	enewgroup ${PN}
	enewuser ${PN} -1 -1 /var/lib/${PN} ${PN}
}
