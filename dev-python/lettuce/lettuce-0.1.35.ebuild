# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"

inherit jnrowe-pypi

DESCRIPTION="Cucumber-ish BDD for python"
HOMEPAGE="http://${PN}.it/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# setuptools is required in RDEPEND for entry points
DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"
