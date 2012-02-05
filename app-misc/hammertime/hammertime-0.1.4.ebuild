# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted due to print syntax
RESTRICT_PYTHON_ABIS="3.*"

MY_PN="Hammertime"

inherit jnrowe-pypi

DESCRIPTION="Simple time tracking with git backend"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools needed in RDEPEND for wrapper scripts
RDEPEND="${DEPEND}
	>=dev-python/git-python-0.3.0
	|| ( >=dev-lang/python-2.6 dev-python/simplejson )"
