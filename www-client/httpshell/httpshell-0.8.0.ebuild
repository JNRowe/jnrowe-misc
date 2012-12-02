# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# 2.5 is restricted due to exception syntax and context handlers
# 3.x is restricted due to print syntax
PYTHON_COMPAT=(python2_6 python2_7)

GITHUB_USER=chrislongo

inherit distutils-r1 jnrowe-github

DESCRIPTION="Interactive shell for issuing HTTP commands to a REST API"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/pygments
	>=dev-python/httplib2-0.7.0
	dev-python/oauth2
	virtual/python-argparse"

PATCHES=("${FILESDIR}"/${P}-use_system_certs.patch)
