# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="A tool to check your Python code against the conventions in PEP 8"
HOMEPAGE="http://github.com/cburroughs/pep8.py"
SRC_URI="http://pypi.python.org/packages/source/${PN::1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=""

DOCS="CHANGES.txt TODO.txt"

src_install() {
	distutils_src_install
	# We make a new wrapper, so that we don't RDEPEND on setuptools
	make_wrapper "${PN}" "python -m${PN}"
}
