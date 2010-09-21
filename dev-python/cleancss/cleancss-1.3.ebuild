# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"

MY_PN="CleanCSS"
MY_P=${MY_PN}-${PV}

inherit jnrowe-pypi

DESCRIPTION="Pythonic markup for CSS, similar to sass and clevercss"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

PYTHON_MODNAME="${PN}.py"
# Could be made to work with Python 2.5 with 'with' future import.
RESTRICT_PYTHON_ABIS="2.[45] 3.*"

S="${WORKDIR}"/${MY_P}

src_install() {
	distutils_src_install

	install_script() {
		module_script_wrapper ${PN}-${PYTHON_ABI}
	}
	python_execute_function install_script
}
