# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"

MY_PN="CleverCSS"
MY_P=${MY_PN}-${PV}

inherit jnrowe-pypi

DESCRIPTION="Funky sass-a-like CSS preprocessor"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

PYTHON_MODNAME="${PN}.py"

S="${WORKDIR}"/${MY_P}

src_install() {
	distutils_src_install

	install_script() {
		module_script_wrapper ${PN}-${PYTHON_ABI}
	}
	python_execute_function install_script
}
