# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Doctest/UnitTest for shell"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="minimal"

DEPEND=""
RDEPEND="dev-python/commandlineapp
	!minimal? ( dev-python/paramiko )"

DOCS=(README)

python_install_all() {
	python-distutils-ng_redoscript "/usr/bin/shell-doctest"
}
