# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"

inherit jnrowe-pypi

DESCRIPTION="An easy (and up to date) way to access Twitter data with Python."
SRC_URI="${SRC_URI}
	http://github.com/ryanmcgrath/twython/raw/221b3377987951dee4c8af7668096bc94f03e7ab/README.markdown -> ${P}-README.markdown"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="|| ( >=dev-lang/python-2.6 dev-python/simplejson )"

RESTRICT_PYTHON_ABIS="3.*"

src_unpack() {
	unpack ${P}.tar.gz

	cp "${DISTDIR}"/${P}-README.markdown ${P}/README.markdown
}
