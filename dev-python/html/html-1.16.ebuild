# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"

inherit jnrowe-pypi

DESCRIPTION="simple, elegant HTML/XHTML generation"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

PYTHON_MODNAME="${PN}.py"

src_prepare() {
	distutils_src_prepare

	# Workaround __doc__ string encoding error
	sed "s,\.decode('utf8'),," -i setup.py
}
