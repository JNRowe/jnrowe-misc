# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"

inherit distutils

DESCRIPTION="Cairo-based graph plotting module"
HOMEPAGE="https://launchpad.net/${PN}"
SRC_URI="http://launchpad.net/${PN}/${PV}/${PV}/+download/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/pycairo"

PYTHON_MODNAME="CairoPlot.py"

src_compile() {
	:
}

src_install() {
	py_install() {
		insinto "$(python_get_sitedir)"
		doins CairoPlot.py
	}
	python_execute_function py_install
	dodoc NEWS TODO
	insinto /usr/share/doc/${PF}/examples
	newins tests.py examples.py
}
