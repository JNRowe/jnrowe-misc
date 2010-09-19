# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2:2.5 3"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="maildir processor using Python as its configuration language"
HOMEPAGE="http://joel.rosdahl.net/maildirproc/"
SRC_URI="http://github.com/downloads/JNRowe/misc-overlay/${P}.tar.gz"
#SRC_URI="${HOMEPAGE}${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="examples"

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT_PYTHON_ABIS="2.4"

src_prepare() {
	# Fix examples links for post-install location
	sed -i 's,examples/,../&,' doc/*.html
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
