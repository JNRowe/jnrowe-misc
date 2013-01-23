# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_{5..7})

inherit jnrowe-pypi

DESCRIPTION="dev-python/sphinx extension to document HTTP APIs"
HOMEPAGE="http://packages.python.org/${PN}/"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is needed in RDEPEND because it installs a setuptools-based plugin
# for Sphinx.
RDEPEND="${DEPEND}
	>=dev-python/sphinx-1.0"

DOCS=(README)
