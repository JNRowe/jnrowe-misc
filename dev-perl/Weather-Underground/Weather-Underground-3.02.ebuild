# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

MODULE_AUTHOR=MNAGUIB
inherit perl-module

DESCRIPTION="Extension for retrieving weather information from wunderground.com"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="amd64 x86"
IUSE=""

SRC_TEST="do"

DEPEND=""
RDEPEND="dev-perl/HTML-TokeParser-Simple
	dev-perl/libwww-perl"

src_test() {
	perl-module_src_test
}
