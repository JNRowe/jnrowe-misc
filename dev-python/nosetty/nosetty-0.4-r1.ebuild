# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# 3.x is restricted due to invalid octal tokens in os.chmod args
PYTHON_COMPAT=(python2_{5..7})

inherit jnrowe-pypi

DESCRIPTION="A plugin to run nosetests more interactively"
HOMEPAGE="http://code.google.com/p/${PN}/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/nose"

DOCS=(CHANGELOG.txt README.txt)

python_prepare_all() {
	# Fix file permission for data file
	sed -i 's,700,600,' -i nosetty/nosetty.py
}

python_install_all() {
	insinto /usr/share/doc/${PF}
	if use examples; then
		doins -r examples
	fi
}
