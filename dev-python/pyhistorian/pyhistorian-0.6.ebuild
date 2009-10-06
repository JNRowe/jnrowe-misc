# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils

DESCRIPTION="A BDD tool for writing specs using Given-When-Then template"
HOMEPAGE="http://github.com/hugobr/pyhistorian"
SRC_URI="http://pypi.python.org/packages/source/${PN::1}/${PN}/${P}.tar.gz
	http://github.com/hugobr/pyhistorian/raw/0caf4444d5de3feaa82d695459a6b3dd89ef43ad/README.rst
		-> ${P}-README.rst"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/should_dsl
	dev-python/termcolor"

src_prepare() {
	cp "${DISTDIR}"/${P}-README.rst "${S}"/README.rst
}
