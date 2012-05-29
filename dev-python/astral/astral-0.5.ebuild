# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_COMPAT="python2_5 python2_6 python2_7"
PYPI_ARCHIVE_SUFFIX="zip"

inherit jnrowe-pypi

DESCRIPTION="Calculations for the position of the sun and moon"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/pytz"

# Tests are broken in current release
RESTRICT="test"

python_install_all() {
	# Install .txt sources too, so we don't have broken links.
	dohtml -A txt -r doc/ || die "dohtml failed"
}
