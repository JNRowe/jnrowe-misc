# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# This version is specifically for Python 2
PYTHON_COMPAT=(python2_7)

inherit distutils-r1 readme.gentoo

DESCRIPTION="maildir processor using Python as its configuration language"
HOMEPAGE="http://joel.rosdahl.net/maildirproc/"
SRC_URI="http://joel.rosdahl.net/maildirproc/releases/${P}.tar.bz2"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND="!mail-filter/maildirproc"
RDEPEND="${DEPEND}"

DOCS=(NEWS README)
HTML_DOCS=(doc/)

python_prepare_all() {
	if use examples; then
		epatch "${FILESDIR}"/${P}-use_examples_link.patch
	else
		epatch "${FILESDIR}"/${P}-use_examples_unset_link.patch
	fi
}

python_install_all() {
	distutils-r1_python_install_all

	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r doc/examples
	fi
}

src_install() {
	distutils-r1_src_install
	readme.gentoo_src_install
}
