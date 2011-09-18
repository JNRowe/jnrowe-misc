# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.5"
RESTRICT_PYTHON_ABIS="2.4 3.*"

inherit jnrowe-pypi

DESCRIPTION="Cucumber-ish BDD for python"
HOMEPAGE="http://lettuce.it/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"

src_unpack() {
	# Broken tarball, with no toplevel directory among other things
	mkdir "${S}"; cd "${S}"
	unpack ${A}
}
