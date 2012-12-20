# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python{2_{5,6,7},3_{1,2,3}})

inherit jnrowe-pypi

DESCRIPTION="Automatic generation of zsh completion functions"
HOMEPAGE="http://bitbucket.org/hhatto/${PN}/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# argparse is optional since 0.3, but until there is a better way to express
# suggested dependencies we'll keep the dep for Python <2.7
DEPEND="virtual/python-argparse[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

python_test() {
	nosetests || die
}
