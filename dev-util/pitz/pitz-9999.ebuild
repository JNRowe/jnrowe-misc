# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils eutils git

EGIT_REPO_URI="git://github.com/mw44118/pitz.git"

DESCRIPTION="A simple issue-tracking system, similar to ditz"
HOMEPAGE="http://pitz.tplus1.com/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

# Setuptools is needed in RDEPEND for wrapper scripts.
RDEPEND="dev-python/clepy
	dev-python/ipython
	dev-python/jinja2
	dev-python/mock
	dev-python/pyyaml
	dev-python/setuptools
	dev-python/tempita"
DEPEND="dev-python/setuptools
	test? ( ${RDEPEND} )"

DISTUTILS_SRC_TEST="nosetests"
RESTRICT_PYTHON_ABIS="2.4 3.*"
DISTUTILS_DISABLE_VERSIONING_OF_PYTHON_SCRIPTS=true

src_prepare() {
	epatch "${FILESDIR}"/${P}-build_fixes.patch
}
