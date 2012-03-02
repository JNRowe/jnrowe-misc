# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*:2.5"
# 2.4 is restricted due to conditional expressions
# < 3.2.3 is restricted due to http://bugs.python.org/issue10570
# TODO: revisit this when 3.2.3 or 3.3 is available in the tree
RESTRICT_PYTHON_ABIS="2.4 3.[12]"
DISTUTILS_SRC_TEST="nosetests"

inherit jnrowe-pypi

DESCRIPTION="Thin and practical terminal formatting, positioning, and more"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_test() {
	testing() {
		# Have to do this to make sure we pick up test in the 2to3 generated
		# tree for Python 3.x
		cd build-${PYTHON_ABI}/lib
		nosetests-${PYTHON_ABI} ${PN} || die "nosetests failed"
	}
	python_execute_function testing
}
