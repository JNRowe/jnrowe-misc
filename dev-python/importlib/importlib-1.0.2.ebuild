# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# importlib is available in >=2.7 or >=3.1, and unlike most similar modules this
# refuses to install to site-packages for those versions
PYTHON_COMPAT="python2_5 python2_6"

inherit jnrowe-pypi

DESCRIPTION="Backport of importlib.import_module() from Python 2.7"

LICENSE="PSF-2.4"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""
