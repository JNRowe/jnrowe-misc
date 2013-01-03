# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_{5..7},3_{1..3}})

inherit distutils-r1

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
