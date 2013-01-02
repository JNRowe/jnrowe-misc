# Copyright © 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python{2_{5..7},3_{1..3}})
PYPI_ARCHIVE_SUFFIX="tar.bz2"

inherit jnrowe-pypi

DESCRIPTION="A human-readable alternative to Python's dir()"
HOMEPAGE="http://inky.github.com/${PN}/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS=(CHANGELOG.markdown README)
