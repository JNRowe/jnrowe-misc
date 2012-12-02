# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
# 3.x prior 3.2.3 is restricted due to http://bugs.python.org/issue10570
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_3"

inherit jnrowe-pypi

DESCRIPTION="Thin and practical terminal formatting, positioning, and more"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND="test? ( dev-python/nose )"
RDEPEND=""

python_test() {
	"${PYTHON}" ./setup.py test || die "Tests failed with ${PYTHON}"
}
