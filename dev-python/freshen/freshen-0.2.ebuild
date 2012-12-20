# Copyright © 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python2_{5,6,7})

inherit jnrowe-pypi eutils

DESCRIPTION="Clone of the Cucumber BDD framework for Python"
HOMEPAGE="https://github.com/rlisagor/${PN}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/nose
	dev-python/pyparsing
	dev-python/pyyaml"

DOCS=(cuke-comparison.txt todo.txt)

python_install_all() {
	insinto /usr/share/doc/${PF}
	if use examples; then
		doins -r examples
	fi
}
