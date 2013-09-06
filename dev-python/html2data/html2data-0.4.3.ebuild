# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_{6,7})

inherit jnrowe-pypi

DESCRIPTION="A simple way to transform a HTML file or URL to structured data"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/httplib2
	dev-python/lxml"

# Unsupported dependencies required by tests
RESTRICT="test"

PATCHES=("${FILESDIR}"/${P}-no_toplevel_tests.patch)
