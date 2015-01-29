# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_7,3_{3,4}})

inherit python-r1

DESCRIPTION="Cairo-based graph plotting module"
HOMEPAGE="https://launchpad.net/${PN}"
SRC_URI="http://launchpad.net/${PN}/${PV}/${PV}/+download/${P}.tar.gz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/pycairo[${PYTHON_USEDEP}]"

DOCS=(NEWS TODO)

src_install() {
	default

	python_foreach_impl python_domodule CairoPlot.py

	insinto /usr/share/doc/${PF}/examples
	newins tests.py examples.py
}
