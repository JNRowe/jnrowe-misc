# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# 3.x is restricted due to print syntax
PYTHON_COMPAT=(python2_{5..7})

# Tests are basically just demos, with no obvious way to check whether they pass
# or fail.  If that changes, add support for running tests!

inherit jnrowe-pypi

DESCRIPTION="Gruffy is Python implementation of Gruff(Ruby Graphing Library)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/pgmagick[${PYTHON_USEDEP}]"

src_install() {
	distutils-r1_src_install

	insinto /usr/share/doc/${PF}/examples
	if use examples ; then
		doins test/*.py || die "doins failed"
	fi
}
