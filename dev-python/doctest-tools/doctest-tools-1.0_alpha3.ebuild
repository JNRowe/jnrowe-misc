# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="2:2.5 3"
SUPPORT_PYTHON_ABIS="1"

inherit distutils
MY_P="${P/_alpha/a}"

DESCRIPTION="Tools to run doctests on code and text files within a directory"
HOMEPAGE="http://code.google.com/p/doctest-tools/"
SRC_URI="http://${PN}.googlecode.com/files/${MY_P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${MY_P}"

DOCS="RELEASE_NOTES.txt"

RESTRICT_PYTHON_ABIS="2.4"
