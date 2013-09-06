# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 3.x is not supported because of file() usage.
PYTHON_COMPAT=(python2_{6,7})

inherit jnrowe-pypi

DESCRIPTION="dev-python/sphinx extension to support generate links to PyPI"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
# setuptools is needed in RDEPEND because it installs a setuptools-based plugin
# for docutils.
RDEPEND="${DEPEND}
	dev-python/sphinx[${PYTHON_USEDEP}]"

DOCS=(README)
