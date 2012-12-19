# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python2_{5,6,7})

inherit jnrowe-pypi

DESCRIPTION="Makes creating apps as simple as defining callbacks to handle options"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# Should switch to system dev-python/paver when it supports multi-ABI.
DEPEND=""
RDEPEND="${DEPEND}"

HTML_DOCS=(docs/build/html/)

python_test() {
	nosetests || die
}
