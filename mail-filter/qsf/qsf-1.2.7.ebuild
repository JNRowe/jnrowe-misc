# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Quick Spam Filter, with support for multiple databases"
HOMEPAGE="http://www.ivarch.com/programs/qsf.shtml"
SRC_URI="mirror://sourceforge/qsf/${P}.tar.bz2"
SLOT="0"
LICENSE="Artistic-2"

KEYWORDS="amd64 x86"
IUSE="gdbm mysql sqlite"

# qsf doesn't absolutely depend on any of the external databases, as it supports
# a few internal formats.
DEPEND="gdbm? ( sys-libs/gdbm )
	mysql? ( dev-db/mysql )
	sqlite? ( dev-db/sqlite:0 )"
RDEPEND="${DEPEND}"

src_configure() {
	econf \
		$(use_with gdbm) \
		$(use_with mysql) \
		$(use_with sqlite)
}

src_install () {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README || die "dodoc failed"
	cd doc
	dodoc NEWS TODO changelog postfix-howto || die "dodoc in doc failed"
}
