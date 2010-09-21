# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.5"
RESTRICT_PYTHON_ABIS="2.4 3.*"

inherit jnrowe-pypi

DESCRIPTION="A script to help you with authoring reStructuredText"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/beaker
	dev-python/docutils
	dev-python/mako
	dev-python/pastescript
	dev-python/sphinx"
