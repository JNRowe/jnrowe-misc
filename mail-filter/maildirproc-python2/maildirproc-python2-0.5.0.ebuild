# Copyright © 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# This version is specifically for Python 2
PYTHON_COMPAT=(python2_{5..7})

inherit distutils-r1

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
		# Fix examples links for post-install location
		sed -i 's,examples/,../&,' doc/*.html
	else
		# Make examples links go to upstream website
		sed -i "s,examples/,${HOMEPAGE}&," doc/*.html
	fi
}

python_install_all() {
	distutils-r1_python_install_all

	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r doc/examples
	fi
}

pkg_postinst() {
	elog "If you wish to take advantage of a specific Python version, or"
	elog "require a module only available for one python version use the"
	elog "${PN}-\$python_version wrapper"
}
