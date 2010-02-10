# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils

DESCRIPTION="A tool to check for updates on web pages"
HOMEPAGE="http://github.com/JNRowe/cupage"
SRC_URI="http://github.com/JNRowe/cupage/tarball/${PV} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/lxml
	|| ( >=dev-lang/python-2.6 dev-python/simplejson )"

S="${WORKDIR}/JNRowe-${PN}-a7c4d2f"

PYTHON_MODNAME="libcupage"
