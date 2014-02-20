# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# importlib is available in >=2.7 or >=3.1, and unlike most similar modules this
# refuses to install to site-packages for those versions
PYTHON_COMPAT=(python2_6)

inherit jnrowe-pypi

DESCRIPTION="Backport of importlib.import_module() from Python 2.7"

LICENSE="PSF-2.4"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""
