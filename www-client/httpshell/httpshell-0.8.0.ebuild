# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# 2.5 is restricted due to exception syntax and context handlers
# 3.x is restricted due to print syntax
PYTHON_COMPAT="python2_6 python2_7"
GITHUB_USER=chrislongo

inherit base python-distutils-ng jnrowe-github

DESCRIPTION="Interactive shell for issuing HTTP commands to a REST API"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/pygments
	>=dev-python/httplib2-0.7.0
	dev-python/oauth2
	python_targets_python2_6? ( dev-python/argparse )"

PATCHES=("${FILESDIR}"/${P}-use_system_certs.patch)

DOCS=(README.md)

src_prepare() {
	base_src_prepare

	python-distutils-ng_src_prepare
}

src_install() {
	default

	python-distutils-ng_src_install
}
