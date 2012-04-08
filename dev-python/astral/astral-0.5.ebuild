# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="nosetests"
PYPI_ARCHIVE_SUFFIX="zip"
PYPI_OLD_DISTUTILS=1

inherit jnrowe-pypi

DESCRIPTION="Calculations for the position of the sun and moon"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND=""
RDEPEND="dev-python/pytz"

PYTHON_MODNAME="${PN}.py"

src_install() {
	distutils_src_install

	# Install .txt sources too, so we don't have broken links.
	dohtml -A txt -r doc/ || die "dohtml failed"
}
