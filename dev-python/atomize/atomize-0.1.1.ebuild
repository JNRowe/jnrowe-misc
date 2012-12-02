# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# 3.x isn't supported due to StringIO changes
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="A simple Python package for easily generating Atom feeds"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""
