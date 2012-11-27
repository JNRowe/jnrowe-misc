# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2 python3_3"
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
