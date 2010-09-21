# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

inherit base jnrowe-pypi

DESCRIPTION="A command-line interface to the GitHub Issues API v2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is needed for command line wrappers
RDEPEND="${DEPEND}
	|| ( >=dev-lang/python-2.6 dev-python/simplejson )"

PATCHES=("${FILESDIR}"/${PN}-0.2.9-Use_pythons_json.patch)

PYTHON_MODNAME="github"
RESTRICT_PYTHON_ABIS="3.*"

src_prepare() {
	base_src_prepare
	distutils_src_prepare
}
