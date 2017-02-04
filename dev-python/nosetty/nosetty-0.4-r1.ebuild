# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# 3.x is restricted due to invalid octal tokens in os.chmod args
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="A plugin to run nosetests more interactively"
HOMEPAGE="http://code.google.com/p/${PN}/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/nose[${PYTHON_USEDEP}]"

DOCS=(CHANGELOG.txt README.txt)

PATCHES=("${FILESDIR}"/${P}-build_fixes.patch)

python_install_all() {
	distutils-r1_python_install_all

	insinto /usr/share/doc/${PF}
	if use examples; then
		doins -r examples
	fi
}
