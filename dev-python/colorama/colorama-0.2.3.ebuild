# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*:2.5"
RESTRICT_PYTHON_ABIS="2.4"

inherit jnrowe-pypi

DESCRIPTION="Cross-platform colored terminal text"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND=""
RDEPEND="${DEPEND}"

DOCS="CHANGELOG.txt"

src_install() {
	distutils_src_install

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins demos/*
	fi
}
