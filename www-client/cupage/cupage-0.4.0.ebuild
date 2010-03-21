# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="A tool to check for updates on web pages"
HOMEPAGE="http://github.com/JNRowe/cupage"
SRC_URI="http://github.com/JNRowe/cupage/tarball/${PV} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/lxml"

S="${WORKDIR}/JNRowe-${PN}-4079b5b"

PYTHON_MODNAME="libcupage"
RESTRICT_PYTHON_ABIS="2.4 2.5 3.*"
