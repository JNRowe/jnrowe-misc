# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_{6,7},3_{2,3}})

inherit distutils-r1

DESCRIPTION="Use GraphViz to generate call graphs from your Python code"
HOMEPAGE="http://${PN}.slowchop.com/"
SRC_URI="http://pycallgraph.slowchop.com/files/download/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND=""
RDEPEND="media-gfx/graphviz"

python_install_all() {
	distutils-r1_python_install_all

	doman man/${PN}.1

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins examples/*.py
	fi
}
