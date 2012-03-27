# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*:2.6"
# 2.5 is restricted due to exception syntax and wildcard relative imports
RESTRICT_PYTHON_ABIS="2.5"

inherit jnrowe-pypi

DESCRIPTION="A simple argparse wrapper for an easier life"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="|| ( dev-python/argparse >=dev-lang/python-2.7 )
	dev-python/six"
