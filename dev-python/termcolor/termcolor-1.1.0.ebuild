# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 2.5 is unsupported because of print function syntax, temporary fix
# would be to disable cprint for those versions if support is needed.
PYTHON_COMPAT=(python{2_{6,7},3_{1..3}})

inherit jnrowe-pypi

DESCRIPTION="ANSI colour formatting for terminals"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS=(CHANGES.rst README.rst)
