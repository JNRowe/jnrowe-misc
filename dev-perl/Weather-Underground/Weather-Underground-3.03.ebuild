# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

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
