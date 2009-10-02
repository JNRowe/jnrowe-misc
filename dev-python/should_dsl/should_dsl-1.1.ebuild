# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils

DESCRIPTION="Should assertions in Python as clear and readable as possible"
HOMEPAGE="http://github.com/hugobr/should-dsl"
SRC_URI="http://pypi.python.org/packages/source/${PN::1}/${PN}/${P}.tar.gz
	http://github.com/hugobr/should-dsl/raw/44c1e5b7b0b442996f7eb5df941e9f76fe55891d/README.rst
		-> ${P}-README.rst"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=""

src_prepare() {
	cp "${DISTDIR}"/${P}-README.rst "${S}"/README.rst
}
