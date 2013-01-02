# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# <2.7 is restricted until the blockdiag ebuild has support
# 3.x is restricted due to print syntax.
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="Generate activity-diagram image file from spec-text file"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="minimal"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=media-gfx/blockdiag-1.2.0[${PYTHON_USEDEP}]
	!minimal? (
		dev-python/docutils
		dev-python/sphinx
	)"

DOCS=(src/README.txt src/TODO.txt)

python_install_all() {
	doman ${PN}.1
}

pkg_postinst() {
	if use minimal && ! has_version dev-python/sphinx; then
		einfo "${PN} installs a sphinx plugin, to make use of it you must"
		einfo "install sphinx."
	fi
}
