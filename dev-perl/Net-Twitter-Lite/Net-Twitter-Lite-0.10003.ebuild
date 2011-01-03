# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
MODULE_AUTHOR="MMIMS"

inherit perl-module

DESCRIPTION="A perl interface to the Twitter API"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SRC_TEST="do"

DEPEND=">=dev-perl/JSON-Any-1.21
	>=dev-perl/libwww-perl-5.805
	>=dev-perl/URI-1.40
	>=dev-perl/Net-OAuth-0.25"
RDEPEND="${DEPEND}"

src_test() {
	perl-module_src_test
}
