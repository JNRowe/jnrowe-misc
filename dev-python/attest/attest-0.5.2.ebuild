# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"
# 3.2 is restricted due to contextlib.nested usage
RESTRICT_PYTHON_ABIS="3.2"
DISTUTILS_SRC_TEST="setup.py"

MY_PN="Attest"

inherit jnrowe-pypi

DESCRIPTION="Modern, Pythonic unit testing"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="minimal"

DEPEND=""
RDEPEND="!minimal? (
		dev-python/progressbar
		dev-python/pygments
	)"

DOCS="AUTHORS.rst CHANGES.rst"
