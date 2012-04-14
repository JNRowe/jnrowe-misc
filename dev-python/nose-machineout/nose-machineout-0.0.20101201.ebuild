# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2"

inherit python-distutils-ng

DESCRIPTION="Machine parsable output plugin for nose"
HOMEPAGE="http://code.google.com/p/${PN}/"
# Unfortunately there are no real releases(just eggs) at either PyPI or the
# Google Code site.
SRC_URI="mirror://github/JNRowe/jnrowe-misc/${P}.tar.bz2"

LICENSE="PSF-2.4"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/nose"
