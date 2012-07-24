# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2"

inherit jnrowe-pypi

DESCRIPTION="Behaviour-driven development, Python style"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/parse
	python_targets_python2_5? ( dev-python/argparse dev-python/simplejson )
	python_targets_python2_6? ( dev-python/argparse )"

# Tests are unusable within portage environment
RESTRICT="test"

PATCHES=("${FILESDIR}"/${P}-dont_install_global_test.patch)

python_install_all() {
	python-distutils-ng_redoscript "/usr/bin/${PN}"
}
