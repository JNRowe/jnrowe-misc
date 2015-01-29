# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# 3.x is restricted due to unicode literals, print statements, etc
PYTHON_COMPAT=(python2_7)

inherit distutils-r1

DESCRIPTION="A tool to log and analyse your exercise regime"
HOMEPAGE="https://github.com/${PN}/${PN}"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="import elevation"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/libxml2[python]
	dev-libs/libxslt[python]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/matplotlib
	dev-python/pygtk[${PYTHON_USEDEP}]
	dev-python/python-dateutil
	dev-python/pywebkitgtk
	dev-python/sqlalchemy-migrate
	import? ( sci-geosciences/gpsbabel )
	elevation? ( sci-libs/gdal[python] )"

PATCHES=("${FILESDIR}"/${PN}-1.10.0-workaround_relative_path_breakage.patch)

DOCS=(CHANGES PLUGINS.README)
