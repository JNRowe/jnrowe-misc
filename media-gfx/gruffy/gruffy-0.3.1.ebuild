# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted due to print syntax
RESTRICT_PYTHON_ABIS="3.*"
# Tests are basically just demos, with no obvious way to check whether they pass
# or fail.  If that changes uncomment the next line.
#DISTUTILS_SRC_TEST="nosetests"
PYPI_OLD_DISTUTILS=1

inherit jnrowe-pypi

DESCRIPTION="Gruffy is Python implementation of Gruff(Ruby Graphing Library)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

RDEPEND="dev-python/pgmagick"
DEPEND="dev-python/setuptools"

src_install() {
	distutils_src_install

	insinto /usr/share/doc/${PF}/examples
	if use examples ; then
		doins test/*.py || die "doins failed"
	fi
}
