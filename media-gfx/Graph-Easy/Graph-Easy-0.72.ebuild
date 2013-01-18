# Copyright © 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
MODULE_AUTHOR=KBAUCOM

inherit perl-module

DESCRIPTION="Render/convert graphs in/from various formats"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="examples minimal"

DEPEND=""
RDEPEND="${DEPEND}
	!minimal? ( media-gfx/graphviz )"

src_install() {
	perl-module_src_install

	insinto /usr/share/doc/${PF}/examples
	if use examples; then
		doins examples/*
	fi
}
