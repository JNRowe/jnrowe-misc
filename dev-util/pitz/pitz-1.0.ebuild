# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"
# Commented until tests are enabled again
#DISTUTILS_SRC_TEST="nosetests"

inherit jnrowe-pypi eutils

DESCRIPTION="A simple issue-tracking system, similar to ditz"
HOMEPAGE="http://pitz.tplus1.com/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
# Tests currently require unavailable mock version
RESTRICT="test"

DEPEND="dev-python/setuptools"
# Tests: test? ( ${RDEPEND} =dev-python/mock-0.4* )
# Setuptools is needed in RDEPEND for wrapper scripts.
RDEPEND=">=dev-python/clepy-0.3.17
	dev-python/ipython
	dev-python/jinja2
	dev-python/pyyaml
	dev-python/setuptools
	dev-python/tempita"

RESTRICT_PYTHON_ABIS="2.4 3.*"
DISTUTILS_DISABLE_VERSIONING_OF_PYTHON_SCRIPTS=true

src_prepare() {
	epatch "${FILESDIR}"/${P}-build_fixes.patch
}
