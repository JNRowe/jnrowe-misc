# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_7,3_4})
PYPI_ARCHIVE_SUFFIX="tar.bz2"

inherit jnrowe-pypi

DESCRIPTION="A human-readable alternative to Python's dir()"
HOMEPAGE="http://inky.github.io/${PN}/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS=(CHANGELOG.markdown README)
