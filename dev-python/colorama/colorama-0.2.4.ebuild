# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2 python3_3"

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
	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins demos/*
	fi
}
