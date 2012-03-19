# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="*"
SUPPORT_PYTHON_ABIS="1"
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

PYTHON_MODNAME="${PN}.py"

DOCS="CHANGELOG.markdown"
