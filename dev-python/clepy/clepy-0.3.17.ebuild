# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"
# Commented until tests are enabled again
#DISTUTILS_SRC_TEST="nosetests"

inherit jnrowe-pypi

DESCRIPTION="Utilities from the Cleveland Python user group"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
# Tests currently require unavailable mock version
RESTRICT="test"

DEPEND="dev-python/setuptools"
# Tests: test? ( ${RDEPEND} =dev-python/mock-0.4* )
RDEPEND="dev-python/decorator"

src_prepare() {
	sed -i 's,mock==0.4,mock,' setup.py
}

RESTRICT_PYTHON_ABIS="2.4"
