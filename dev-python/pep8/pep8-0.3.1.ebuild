# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit jnrowe-pypi

DESCRIPTION="A tool to check your Python code against the conventions in PEP 8"
HOMEPAGE="http://github.com/cburroughs/pep8.py"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=""

DOCS="CHANGES.txt TODO.txt"

src_install() {
	distutils_src_install

	module_script_wrapper "${PN}" "${PN}" "_main"
}
