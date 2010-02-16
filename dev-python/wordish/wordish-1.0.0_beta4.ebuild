# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils versionator

MY_PV=$(get_version_component_range -3)$(get_version_component_range 4)

DESCRIPTION="Parses a shell session, test the commands compare the output"
HOMEPAGE="http://pypi.python.org/pypi/wordish/"
SRC_URI="http://pypi.python.org/packages/source/${PN::1}/${PN}/${PN}-${MY_PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

RESTRICT_PYTHON_ABIS="2.4 2.5 3.*"

S="${WORKDIR}"/${PN}-${MY_PV}
