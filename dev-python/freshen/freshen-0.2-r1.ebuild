# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi eutils

DESCRIPTION="Clone of the Cucumber BDD framework for Python"
HOMEPAGE="https://github.com/rlisagor/${PN}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/nose[${PYTHON_USEDEP}]
	dev-python/pyparsing[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]"

DOCS=(cuke-comparison.txt todo.txt)

python_install_all() {
	distutils-r1_python_install_all

	insinto /usr/share/doc/${PF}
	if use examples; then
		doins -r examples
	fi
}
