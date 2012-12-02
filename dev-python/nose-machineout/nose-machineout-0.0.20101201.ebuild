# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2 python3_3"

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
