# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Cucumber-ish BDD for python"
HOMEPAGE="http://${PN}.it/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# setuptools is required in RDEPEND for entry points
DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"

python_install_all() {
	python-distutils-ng_redoscript "/usr/bin/${PN}"
}
