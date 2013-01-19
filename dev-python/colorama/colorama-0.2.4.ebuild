# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=(python{2_{5..7},3_{1..3}})

inherit jnrowe-pypi

DESCRIPTION="Cross-platform colored terminal text"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND=""
RDEPEND="${DEPEND}"

DOCS=(README.txt)

python_install_all() {
	distutils-r1_python_install_all

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins demos/*
	fi
}
