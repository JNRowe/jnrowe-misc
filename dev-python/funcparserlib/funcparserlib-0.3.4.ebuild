# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
# 2.4 is unsupported because of conditional expressions, and 3.x is unsupported
# because of exception syntax.
RESTRICT_PYTHON_ABIS="2.4 3.*"

inherit jnrowe-pypi

DESCRIPTION="Recursive descent parsing library based on functional combinators"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

# Examples are broken, and doctests in documentation will fail with Py2.7+
# because of float repr changes.
RESTRICT="test"

DOCS="CHANGES README doc/Brackets.md doc/FAQ.md doc/Illustrated.md
	doc/Tutorial.md"
