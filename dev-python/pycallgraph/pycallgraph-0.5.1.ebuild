# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"

inherit distutils

DESCRIPTION="Use GraphViz to generate call graphs from your Python code"
HOMEPAGE="http://${PN}.slowchop.com/"
SRC_URI="http://pycallgraph.slowchop.com/files/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND=""
RDEPEND="media-gfx/graphviz"

PYTHON_MODNAME="${PN}.py"

src_install() {
	distutils_src_install

	doman man/${PN}.1

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins examples/*.py
	fi
}
