# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

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
