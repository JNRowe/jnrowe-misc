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
IUSE="minimal test"

# The package correctly handles the 2.6 json module, but there is no *usable*
# way to express the multi-ABI test dependencies with upstream's distutils
# eclass.
DEPEND="test? ( dev-python/simplejson )"
RDEPEND="!minimal? (
		dev-python/lxml
		dev-python/progressbar
		dev-python/pygments
		|| ( >=dev-lang/python-2.6 dev-python/simplejson )
	)"

DOCS="AUTHORS.rst CHANGES.rst"
