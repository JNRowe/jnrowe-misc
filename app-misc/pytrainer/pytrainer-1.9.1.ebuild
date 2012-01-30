# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2:2.6"
# 2.4 is restricted due to conditional expressions, exception syntax, etc
# 2.5 is restricted due to exception syntax
# 3.x is restricted due to unicode literals, print statements, etc
RESTRICT_PYTHON_ABIS="2.[45] 3.*"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="A tool to log and analyse your exercise regime"
HOMEPAGE="https://github.com/pytrainer/pytrainer"
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
	dev-python/python-dateutil:python-2
	dev-python/pywebkitgtk
	dev-python/sqlalchemy-migrate
	import? ( sci-geosciences/gpsbabel )
	elevation? ( sci-libs/gdal[python] )"

DOCS="CHANGES PLUGINS.README"
