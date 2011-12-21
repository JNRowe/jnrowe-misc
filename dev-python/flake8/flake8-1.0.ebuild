# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.6"
# 2.[45] is restricted due to except...as syntax
RESTRICT_PYTHON_ABIS="2.[45] 3.*"
DISTUTILS_SRC_TEST="nosetests"

inherit jnrowe-pypi

DESCRIPTION="Python code checking using pep8 and pyflakes"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# Unfortunately, this package bundles slightly modified versions of pep8 and
# pyflakes.  Stripping the bundling and monkey patching in the changes will be
# a huge maintenance burden, so we'll try to live with it for the time being.
DEPEND=""
RDEPEND="${DEPEND}"

DOCS="CONTRIBUTORS.txt"
