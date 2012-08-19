# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# Python 2.5 isn't supported by nose2
PYTHON_COMPAT="python2_6 python2_7 python3_1 python3_2"
MY_PV="${PV/_alpha/a}"

inherit jnrowe-pypi

DESCRIPTION="nose2 plugin for coverage reporting"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/cov-core
	dev-python/nose2"

DOCS=(README.txt)
