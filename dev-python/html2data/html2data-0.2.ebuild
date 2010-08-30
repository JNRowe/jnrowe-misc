# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
DISTUTILS_SRC_TEST="nosetests"

inherit jnrowe-pypi

DESCRIPTION="A simple way to transform a HTML file or URL to structured data."

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/httplib2
	dev-python/lxml"

RESTRICT_PYTHON_ABIS="3.*"
