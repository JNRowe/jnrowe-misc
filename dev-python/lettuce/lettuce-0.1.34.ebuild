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
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"

DOCS=(README.md)

src_unpack() {
	# Broken tarball, with no toplevel directory among other things
	mkdir "${S}"; cd "${S}"
	unpack ${A}
}

python_install_all() {
	python-distutils-ng_redoscript "/usr/bin/${PN}"
}

src_install() {
	default

	python-distutils-ng_src_install
}
