# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

# 2.5 is restricted due to exception syntax
# 3.x is restricted due to unicode literals, print statements, etc
PYTHON_COMPAT="python2_6 python2_7"

inherit python-distutils-ng

DESCRIPTION="A tool to log and analyse your exercise regime"
HOMEPAGE="https://github.com/${PN}/${PN}"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
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

DOCS="CHANGES PLUGINS.README"
