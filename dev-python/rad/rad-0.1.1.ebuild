# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="A super easy console highlighter.  Text goes in, colour comes out."
HOMEPAGE="http://pypi.python.org/pypi/rad/"
SRC_URI="mirror://pypi/${PN::1}/${PN}/${P}.tar.gz
	http://github.com/robbles/rad/raw/v0.1.1/README.rst -> ${P}-README.rst"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/colorama
	dev-python/plac
	dev-python/pyyaml"

RESTRICT_PYTHON_ABIS="2.[45] 3.*"

src_unpack() {
	unpack ${P}.tar.gz

	cp "${DISTDIR}"/${P}-README.rst ${P}/README.rst
}
