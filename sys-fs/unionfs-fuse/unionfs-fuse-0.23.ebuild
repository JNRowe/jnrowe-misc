# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A unionfs filesystem implementation for fuse"
HOMEPAGE="http://podgorny.cz/moin/UnionFsFuse"
SRC_URI="http://podgorny.cz/unionfs-fuse/releases/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

DEPEND="sys-fs/fuse"
RDEPEND="${DEPEND}"

src_install() {
	dobin src/unionfs
	dodoc CREDITS NEWS
	doman man/${PN}.8
}
