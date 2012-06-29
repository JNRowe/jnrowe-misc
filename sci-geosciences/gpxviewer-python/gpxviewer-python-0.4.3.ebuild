# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

# 3.x is restricted due to lack of support in python-distutils-extra
PYTHON_COMPAT="python2_5 python2_6 python2_7"

GITHUB_USER=andrewgee
MY_PN=gpxviewer

inherit base python-distutils-ng jnrowe-github

DESCRIPTION="GPXViewer GPS trace viewer"
HOMEPAGE="http://andrewgee.org/blog/projects/gpxviewer"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="dev-python/python-distutils-extra
	dev-util/intltool"
RDEPEND="dev-python/python-osmgpsmap"

python_install_all() {
	python-distutils-ng_redoscript "/usr/bin/${PN%-*}"
}
