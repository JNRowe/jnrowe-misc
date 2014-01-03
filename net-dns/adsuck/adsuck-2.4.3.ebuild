# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit base toolchain-funcs user

DESCRIPTION="Small DNS server that spoofs blacklisted addresses"
HOMEPAGE="https://opensource.conformal.com/wiki/${PN}"
SRC_URI="https://opensource.conformal.com/snapshots/${PN}/${P}.tgz"

KEYWORDS="amd64 x86"
SLOT="0"
LICENSE="MIT"
IUSE=""

DEPEND="dev-libs/libevent
	net-libs/ldns"
RDEPEND="${DEPEND}"

PATCHES=("${FILESDIR}"/${P}-build_env.patch)

src_compile() {
	emake CC="$(tc-getCC)"
}

pkg_preinst() {
	enewgroup ${PN}
	enewuser ${PN} -1 -1 /var/lib/${PN} ${PN}
}
