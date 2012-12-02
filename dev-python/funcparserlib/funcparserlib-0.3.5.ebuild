# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# 3.x is unsupported because of exception syntax.
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Recursive descent parsing library based on functional combinators"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

# Examples are broken, and doctests in documentation will fail with Py2.7+
# because of float repr changes.
RESTRICT="test"

DOCS=(CHANGES doc/Brackets.md doc/FAQ.md doc/Illustrated.md doc/Tutorial.md)
