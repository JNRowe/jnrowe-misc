# Copyright © 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# This version is specifically for Python 3
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python3_1 python3_2 python3_3"

inherit python-distutils-ng

DESCRIPTION="maildir processor using Python as its configuration language"
HOMEPAGE="http://joel.rosdahl.net/${PN}/"
SRC_URI="http://joel.rosdahl.net/maildirproc/releases/${P}.tar.bz2"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND="!mail-filter/maildirproc-python2"
RDEPEND="${DEPEND}"

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
	dohtml doc/*.{css,html}

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
