# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_7,3_{2,3,4}})

inherit jnrowe-pypi

DESCRIPTION="Automatic generation of zsh completion functions"
HOMEPAGE="https://bitbucket.org/hhatto/${PN}/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

python_test() {
	nosetests || die
}
