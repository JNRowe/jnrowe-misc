# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted due to lack of support in python-distutils-extra
RESTRICT_PYTHON_ABIS="3.*"

GITHUB_USER=andrewgee
MY_PN=gpxviewer

inherit base distutils jnrowe-github

DESCRIPTION="GPXViewer GPS trace viewer"
HOMEPAGE="http://andrewgee.org/blog/projects/gpxviewer"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/python-distutils-extra
	dev-util/intltool"
RDEPEND="dev-python/python-osmgpsmap"

PYTHON_MODNAME=${MY_PN}

PATCHES=("${FILESDIR}"/${P}-fix_xdg_cache_home.patch)

src_prepare() {
	base_src_prepare
	distutils_src_prepare
}
