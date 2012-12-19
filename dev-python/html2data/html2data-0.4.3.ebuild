# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python2_{5,6,7})

inherit jnrowe-pypi

DESCRIPTION="A simple way to transform a HTML file or URL to structured data"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/httplib2
	dev-python/lxml"

# Unsupported dependencies required by tests
RESTRICT="test"
