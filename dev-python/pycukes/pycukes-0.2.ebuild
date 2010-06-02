# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="*"
SUPPORT_PYTHON_ABIS="1"

inherit jnrowe-pypi

DESCRIPTION="A Cucumber-like BDD framework built on top of Pyhistorian"
HOMEPAGE="http://github.com/hugobr/pycukes"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/story_parser
	dev-python/pyhistorian"
