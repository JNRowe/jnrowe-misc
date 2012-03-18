# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="3"
# This version is specifically for Python 3
RESTRICT_PYTHON_ABIS="2.*"

inherit distutils

DESCRIPTION="maildir processor using Python as its configuration language"
HOMEPAGE="http://joel.rosdahl.net/${PN}/"
SRC_URI="http://joel.rosdahl.net/maildirproc/releases/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND="!mail-filter/maildirproc-python2"
RDEPEND="${DEPEND}"

src_prepare() {
	if use examples; then
		# Fix examples links for post-install location
		sed -i 's,examples/,../&,' doc/*.html
	else
		# Make examples links go to upstream website
		sed -i "s,examples/,${HOMEPAGE}&," doc/*.html
	fi
}

src_install() {
	distutils_src_install

	dohtml doc/*.{css,html}
	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r doc/examples
	fi
}

pkg_postinst() {
	distutils_pkg_postinst

	elog "If you wish to take advantage of a specific Python version, or"
	elog "require a module only available for one python version use the"
	elog "${PN}-\$python_version wrapper"
}
