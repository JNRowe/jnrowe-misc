# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# 2.5 is restricted due to context handler usage without __future__
PYTHON_COMPAT="python2_6 python2_7 python3_1 python3_2"

inherit jnrowe-pypi

DESCRIPTION="Colourful TAB completion for Python prompt"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/pyrepl"

DOCS=(README)

src_install() {
	default

	python-distutils-ng_src_install
}
