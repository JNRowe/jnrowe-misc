# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# 2.5 is restricted due to except...as syntax
# 3.x is restricted due to print command
PYTHON_COMPAT="python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="A super easy console highlighter.  Text goes in, colour comes out"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/colorama
	dev-python/plac
	dev-python/pyyaml"

DOCS=(README.rst)

python_install_all() {
	python-distutils-ng_redoscript "/usr/bin/${PN}"
}
