# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_{6,7})
GITHUB_USER="JNRowe"

inherit distutils-r1 jnrowe-github

DESCRIPTION="Modules for working with points on Earth"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS=(NEWS README)

python_test() {
	# Don't use test_doc as it requires net access
	./setup.py test_code
}

python_install_all() {
	distutils-r1_python_install_all

	docinto usage
	dodoc doc/*.txt
}
