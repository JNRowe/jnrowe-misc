# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils

DESCRIPTION="A Cucumber-like BDD framework built on top of Pyhistorian"
HOMEPAGE="http://github.com/hugobr/pycukes"
SRC_URI="http://pypi.python.org/packages/source/${PN::1}/${PN}/${P}.tar.gz
	http://github.com/hugobr/${PN}/raw/6d2b224c3fb11384a5f24983264cfe21acef42ef/README.rst
		-> ${P}-README.rst"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is needed for wrapper script in /usr/bin
RDEPEND="${DEPEND}
	dev-python/pyhistorian"

src_prepare() {
	cp "${DISTDIR}"/${P}-README.rst "${S}"/README.rst
}
