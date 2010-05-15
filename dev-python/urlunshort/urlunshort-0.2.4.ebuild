# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
DISTUTILS_SRC_TEST="nosetests"

inherit jnrowe-pypi

DESCRIPTION="Tools for detecting and expanding shortened URLs"
HOMEPAGE="http://bitbucket.org/runeh/urlunshort"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

# tests span network boundaries, and depend on upstream availablility
RESTRICT="test"

RESTRICT_PYTHON_ABIS="2.4 3.*"
