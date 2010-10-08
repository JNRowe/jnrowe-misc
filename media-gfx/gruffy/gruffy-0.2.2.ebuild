# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*:2.5"
# 2.5 is required for conditional expressions
RESTRICT_PYTHON_ABIS="2.4"
# Tests are basically just demos, with no obvious way to check whether they pass
# or fail.  If that changes uncomment the next line.
#DISTUTILS_SRC_TEST="nosetests"

inherit jnrowe-pypi

DESCRIPTION="Gruffy is Python implementation of Gruff(Ruby Graphing Library)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
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
