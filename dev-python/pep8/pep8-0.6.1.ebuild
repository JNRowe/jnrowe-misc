# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="*"
SUPPORT_PYTHON_ABIS="1"

inherit eutils jnrowe-pypi

DESCRIPTION="A tool to check your Python code against the conventions in PEP 8"
HOMEPAGE="http://github.com/jcrocholl/pep8"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for wrapper scripts.
RDEPEND="dev-python/setuptools"

DOCS="CHANGES.txt TODO.txt"

PYTHON_MODNAME="pep8.py"
