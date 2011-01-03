# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MODULE_AUTHOR=KBAUCOM
inherit perl-module

DESCRIPTION="ASCII sprite animation framework"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="amd64 x86"
IUSE=""

SRC_TEST="do"

DEPEND="dev-perl/Curses"
RDEPEND="${DEPEND}"

src_test() {
	perl-module_src_test
}
