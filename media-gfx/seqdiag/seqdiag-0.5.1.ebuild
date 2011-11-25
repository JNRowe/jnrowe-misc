# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.5"
# 2.4 is restricted due to missing dependency support
# 3.x is restricted due to print syntax
RESTRICT_PYTHON_ABIS="2.4 3.*"

inherit jnrowe-pypi

DESCRIPTION="Generate sequence-diagram image files from spec-text files"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="examples minimal pdf"

DEPEND="dev-python/setuptools"
# Setuptools is required at runtime for wrapper scripts
RDEPEND="dev-python/setuptools
	dev-python/funcparserlib
	dev-python/imaging
	>=media-gfx/blockdiag-0.9.5
	!minimal? ( dev-python/sphinx )
	pdf? ( dev-python/reportlab )"

DOCS="src/README.txt src/TODO.txt"

# Would prefer Sphinx extension in sphinxcontrib/, but keep up
# compatibilty with upstream
PYTHON_MODNAME="${PN} sphinxcontrib_${PN}.py"

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
