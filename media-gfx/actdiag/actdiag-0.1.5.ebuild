# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.6"
# 2.5 is required for funcparserlib dependency,
# 3.x is restricted due to print syntax.
RESTRICT_PYTHON_ABIS="3.*"

inherit jnrowe-pypi

DESCRIPTION="Generate activity-diagram image file from spec-text file"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="minimal"

DEPEND="dev-python/setuptools"
RDEPEND=">=media-gfx/blockdiag-0.8.1
	!minimal? ( dev-python/sphinx )"

DOCS="src/README.txt src/TODO.txt"

# Would prefer Sphinx extension in sphinxcontrib/, but keep up
# compatibilty with upstream
PYTHON_MODNAME="${PN} sphinxcontrib_${PN}.py"

src_install() {
	distutils_src_install
}

pkg_postinst() {
	distutils_pkg_postinst

	if use minimal && ! has_version dev-python/sphinx; then
		einfo "${PN} installs a sphinx plugin, to make use of it you must"
		einfo "install sphinx."
	fi
}
