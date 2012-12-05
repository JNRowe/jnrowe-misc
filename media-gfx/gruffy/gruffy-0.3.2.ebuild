# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# 3.x is restricted due to print syntax
PYTHON_COMPAT=(python2_5 python2_6 python2_7)

# Tests are basically just demos, with no obvious way to check whether they pass
# or fail.  If that changes, add support for running tests!

inherit jnrowe-pypi

DESCRIPTION="Gruffy is Python implementation of Gruff(Ruby Graphing Library)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

RDEPEND="dev-python/pgmagick"
DEPEND="dev-python/setuptools"

src_install() {
	distutils-r1_src_install

	insinto /usr/share/doc/${PF}/examples
	if use examples ; then
		doins test/*.py || die "doins failed"
	fi
}
