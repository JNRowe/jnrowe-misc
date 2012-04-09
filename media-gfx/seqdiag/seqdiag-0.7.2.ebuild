# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# <2.7 is restricted until the blockdiag ebuild has support
# 3.x is restricted due to print syntax
PYTHON_COMPAT="python2_7"

inherit jnrowe-pypi

DESCRIPTION="Generate sequence-diagram image files from spec-text files"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples minimal"

DEPEND="dev-python/setuptools"
# Setuptools is required at runtime for wrapper scripts
RDEPEND="dev-python/setuptools
	>=media-gfx/blockdiag-1.1.1
	!minimal? ( dev-python/sphinx )"

DOCS=(src/README.txt src/TODO.txt)

python_install_all() {
	doman ${PN}.1
	insinto /usr/share/doc/${PF}
	if use examples ; then
		doins -r examples || die "doins failed"
	fi

	python-distutils-ng_redoscript "/usr/bin/${PN}"
}

src_install() {
	default

	python-distutils-ng_src_install
}

pkg_postinst() {
	if use minimal && ! has_version dev-python/sphinx; then
		einfo "${PN} installs a sphinx plugin, to make use of it you must"
		einfo "install sphinx."
	fi
}
