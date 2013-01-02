# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python{2_{5..7},3_{1..3}})

inherit jnrowe-pypi

DESCRIPTION="simple, elegant HTML/XHTML generation"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

python_prepare_all() {
	# Workaround __doc__ string encoding error
	sed "s,\.decode('utf8'),," -i setup.py
}
