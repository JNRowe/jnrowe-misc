# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2"

inherit jnrowe-pypi

DESCRIPTION="Cross-platform colored terminal text"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND=""
RDEPEND="${DEPEND}"

DOCS=(README.txt)

python_install_all() {
	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins demos/*
	fi
}

src_install() {
	default

	python-distutils-ng_src_install
}
