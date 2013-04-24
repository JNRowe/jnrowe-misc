# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# 3.x is restricted due to lack of support in python-distutils-extra
PYTHON_COMPAT=(python2_{5..7})

GITHUB_USER=andrewgee

inherit eutils distutils-r1 jnrowe-github

DESCRIPTION="GPXViewer GPS trace viewer"
HOMEPAGE="http://andrewgee.org/blog/projects/gpxviewer"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/python-distutils-extra
	dev-util/intltool"
RDEPEND="dev-python/python-osmgpsmap[${PYTHON_USEDEP}]"

PATCHES=("${FILESDIR}"/${P}-valid_desktop.patch)
