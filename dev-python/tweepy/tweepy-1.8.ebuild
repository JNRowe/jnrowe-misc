# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"

inherit jnrowe-pypi

DESCRIPTION="Twitter library for python"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
# We should depend on dev-python/oauth, and strip the bundled versions but the
# ebuild in the main tree has no support for multiple Python versions.
RDEPEND="|| ( >=dev-lang/python-2.6 dev-python/simplejson )"
