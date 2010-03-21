# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="*"

inherit jnrowe-pypi

DESCRIPTION="A plugin to run nosetests more interactively"
HOMEPAGE="http://code.google.com/p/nosetty/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/nose"

DOCS="CHANGELOG.txt"

src_prepare() {
	# Fix file permission for data file
	sed -i 's,700,600,' -i nosetty/nosetty.py
}

src_install() {
	distutils_src_install

	insinto /usr/share/doc/${PF}
	if use examples; then
		doins -r examples
	fi
}
