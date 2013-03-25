# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# 2.5 is restricted due to exception syntax
# 3.x is restricted due to unicode literals, print statements, etc
PYTHON_COMPAT=(python2_{6,7})

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
	dev-python/lxml
	dev-python/matplotlib
	dev-python/pygtk
	dev-python/python-dateutil
	dev-python/pywebkitgtk
	dev-python/sqlalchemy-migrate
	import? ( sci-geosciences/gpsbabel )
	elevation? ( sci-libs/gdal[python] )"

DOCS=(CHANGES PLUGINS.README)
