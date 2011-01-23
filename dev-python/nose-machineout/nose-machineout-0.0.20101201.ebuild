# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"

inherit distutils

DESCRIPTION="Machine parsable output plugin for nose"
HOMEPAGE="http://code.google.com/p/nose-machineout/"
# Unfortunately there are no real releases(just eggs) at either PyPI or the
# Google Code site.
SRC_URI="https://github.com/downloads/JNRowe/misc-overlay/${P}.tar.bz2"

LICENSE="PSF-2.4"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-python/nose"

PYTHON_MODNAME="machineout.py"
