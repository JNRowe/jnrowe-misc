# Copyright © 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_{5..7})

inherit jnrowe-pypi

DESCRIPTION="Add options to doctest examples while they are running"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

python_install_all() {
	newdoc docs/index.txt README.rst
}
