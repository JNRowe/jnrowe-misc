# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# 2.5 is restricted due to exception syntax and context handlers
# 3.x is restricted due to print syntax
PYTHON_COMPAT="python2_6 python2_7"
GITHUB_USER=chrislongo

inherit python-distutils-ng jnrowe-github

DESCRIPTION="Interactive shell for issuing HTTP commands to a REST API"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/pygments
	>=dev-python/httplib2-0.7.0
	dev-python/oauth2
	python_targets_python2_6? ( dev-python/argparse )"

DOCS=(README.md)

src_install() {
	default

	python-distutils-ng_src_install
}
