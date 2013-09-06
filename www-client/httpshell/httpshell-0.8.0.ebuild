# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 3.x is restricted due to print syntax
PYTHON_COMPAT=(python2_{6,7})

GITHUB_USER=chrislongo

inherit distutils-r1 jnrowe-github

DESCRIPTION="Interactive shell for issuing HTTP commands to a REST API"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/pygments[${PYTHON_USEDEP}]
	>=dev-python/httplib2-0.7.0[${PYTHON_USEDEP}]
	dev-python/oauth2[${PYTHON_USEDEP}]
	virtual/python-argparse[${PYTHON_USEDEP}]"

PATCHES=("${FILESDIR}"/${P}-use_system_certs.patch)
