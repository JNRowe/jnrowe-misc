# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.7"
# <2.7 is restricted until the blockdiag ebuild has support
# 3.x is restricted due to print syntax.
RESTRICT_PYTHON_ABIS="2.[456] 3.*"

inherit jnrowe-pypi

DESCRIPTION="Generate activity-diagram image file from spec-text file"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="minimal"

DEPEND="dev-python/setuptools"
RDEPEND=">=media-gfx/blockdiag-1.1.0
	!minimal? ( dev-python/sphinx )"

DOCS="src/README.txt src/TODO.txt"

PYTHON_MODNAME="${PN} ${PN}_sphinxhelper.py"

src_install() {
	distutils_src_install

	doman ${PN}.1
}

pkg_postinst() {
	distutils_pkg_postinst

	if use minimal && ! has_version dev-python/sphinx; then
		einfo "${PN} installs a sphinx plugin, to make use of it you must"
		einfo "install sphinx."
	fi
}
