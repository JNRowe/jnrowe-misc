# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_{6,7})

inherit jnrowe-pypi

DESCRIPTION="Sphinx extension to convert ANSI colour sequences to coloured HTML output."
HOMEPAGE="http://packages.python.org/${PN}/"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
# setuptools is needed in RDEPEND because it installs a setuptools-based plugin
# for Sphinx.
RDEPEND="${DEPEND}
	dev-python/sphinx[${PYTHON_USEDEP}]"

DOCS=(CHANGES.rst README)
