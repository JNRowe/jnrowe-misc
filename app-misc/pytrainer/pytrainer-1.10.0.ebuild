# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 3.x is restricted due to unicode literals, print statements, etc
PYTHON_COMPAT=(python2_7)
GITHUB_USER=${PN}
GITHUB_TAG=v${PV}

inherit jnrowe-github distutils-r1

DESCRIPTION="A tool to log and analyse your exercise regime"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="import elevation"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/libxml2[python]
	dev-libs/libxslt[python]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/pygtk[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pywebkitgtk[${PYTHON_USEDEP}]
	dev-python/sqlalchemy-migrate[${PYTHON_USEDEP}]
	import? ( sci-geosciences/gpsbabel )
	elevation? ( sci-libs/gdal[python] )"

PATCHES=("${FILESDIR}"/${P}-workaround_relative_path_breakage.patch)

DOCS=(CHANGES PLUGINS.README README.md)
