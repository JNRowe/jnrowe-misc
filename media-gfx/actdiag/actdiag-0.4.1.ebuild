# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# <2.7 is restricted until the blockdiag ebuild has support
# 3.x is restricted due to print syntax.
PYTHON_COMPAT=(python2_7)

inherit eutils jnrowe-pypi

DESCRIPTION="Generate activity-diagram image file from spec-text file"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="minimal"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=dev-python/blockdiag-1.2.0[${PYTHON_USEDEP}]
	!minimal? ( dev-python/sphinx[${PYTHON_USEDEP}] )"

DOCS=(src/README.txt src/TODO.txt)

python_install_all() {
	distutils-r1_python_install_all

	doman ${PN}.1
}

src_install() {
	default

	distutils-r1_src_install

	use minimal && optfeature "Sphinx support" dev-python/sphinx
}
