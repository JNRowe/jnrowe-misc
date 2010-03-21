# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Wrapper for the Universal Feed Parser which caches the results"
HOMEPAGE="http://www.doughellmann.com/projects/feedcache/"
SRC_URI="http://www.doughellmann.com/downloads/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/feedparser"

RESTRICT_PYTHON_ABIS="3.*"
