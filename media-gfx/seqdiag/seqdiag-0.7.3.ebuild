# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.7"
# <2.7 is restricted until the blockdiag ebuild has support
# 3.x is restricted due to print syntax
RESTRICT_PYTHON_ABIS="2.[56] 3.*"

inherit jnrowe-pypi

DESCRIPTION="Generate sequence-diagram image files from spec-text files"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples minimal"

DEPEND="dev-python/setuptools"
# Setuptools is required at runtime for wrapper scripts
RDEPEND="dev-python/setuptools
	>=media-gfx/blockdiag-1.1.2
	!minimal? ( dev-python/sphinx )"

DOCS="src/README.txt src/TODO.txt"

PYTHON_MODNAME="${PN} ${PN}_sphinxhelper.py"

src_install() {
	distutils_src_install

	doman ${PN}.1
	insinto /usr/share/doc/${PF}
	if use examples ; then
		doins -r examples || die "doins failed"
	fi
}

pkg_postinst() {
	distutils_pkg_postinst

	if use minimal && ! has_version dev-python/sphinx; then
		einfo "${PN} installs a sphinx plugin, to make use of it you must"
		einfo "install sphinx."
	fi
}