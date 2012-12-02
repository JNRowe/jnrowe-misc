# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2 python3_3"

inherit python-distutils-ng

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
	doman man/${PN}.1

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins examples/*.py
	fi
}
