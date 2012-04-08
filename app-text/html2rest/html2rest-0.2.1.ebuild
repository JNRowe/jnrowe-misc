# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# 3.x is restricted due to use of print syntax
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Convert HTML to restructuredText"

# Despite the BSD licence definition in the package's metadata, the
# actual licence text in the module is derived from the MIT licence
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

python_install_all() {
	python-distutils-ng_redoscript "/usr/bin/${PN}"
}
