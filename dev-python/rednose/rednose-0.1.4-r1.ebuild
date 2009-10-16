# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit jnrowe-pypi

DESCRIPTION="coloured output for nosetests"
HOMEPAGE="http://github.com/gfxmonk/rednose/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/nose
	dev-python/termstyle"

src_install() {
	distutils_src_install

	find "${D}" -name termstyle.py -exec rm {} +
}

