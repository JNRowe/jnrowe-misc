# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
DISTUTILS_SRC_TEST="nosetests"

inherit jnrowe-pypi

DESCRIPTION="Parses a shell session, test the commands compare the output"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# sphinx is required for documentation builds, but the current release is
# missing the necessary files for a rebuild.
DEPEND=""
RDEPEND="dev-python/docutils"

RESTRICT_PYTHON_ABIS="2.[45] 3.*"
