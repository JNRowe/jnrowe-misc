# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# 2.5 is unsupported because of print function syntax, temporary fix
# would be to disable cprint for those versions if support is needed.
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_6 python2_7 python3_1 python3_2"

inherit jnrowe-pypi

DESCRIPTION="ANSI colour formatting for terminals"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS=(CHANGES.rst README.rst)
