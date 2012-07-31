# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# 3.x is restricted due to non-relative imports
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Grep GnuPG-encrypted YAML password safe"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/pyyaml
	dev-python/termcolor
	dev-python/xerox"

python_install_all() {
	python-distutils-ng_redoscript "/usr/bin/${PN}"
}
