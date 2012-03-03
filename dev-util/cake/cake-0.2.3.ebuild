# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.6"
# Python 2.5 is resticted due to new exception handling syntax
# Python 3 is resticted due to print syntax
RESTRICT_PYTHON_ABIS="2.5 3.*"

inherit jnrowe-pypi

DESCRIPTION="Minimalistic Python build tool inspired by Rake"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/colorama"
