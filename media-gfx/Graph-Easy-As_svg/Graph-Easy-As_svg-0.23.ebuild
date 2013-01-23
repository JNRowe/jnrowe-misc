# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
MODULE_AUTHOR=TELS
MODULE_SECTION=graph

inherit perl-module

DESCRIPTION="Graph::Easy output as Scalable Vector Graphics (SVG)"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples minimal"

DEPEND="dev-perl/ImageInfo
	media-gfx/Graph-Easy"
RDEPEND="${DEPEND}"

src_install() {
	perl-module_src_install

	insinto /usr/share/doc/${PF}/examples
	if use examples; then
		doins examples/*
	fi
}
