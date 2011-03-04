# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted due to print syntax
RESTRICT_PYTHON_ABIS="3.*"

MY_PN="Hammertime"

inherit jnrowe-pypi

DESCRIPTION="Simple time tracking with git backend"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools needed in RDEPEND for wrapper scripts
RDEPEND="${DEPEND}
	>=dev-python/git-python-0.3.0
	dev-python/simplejson"

src_prepare() {
	# hammertime works with current simplejson releases as well as just 2.1.1
	sed -i '/simplejson/s,==,>=,' setup.py

	# README.rst and README.md are copies of eachother using different syntaxes,
	# we don't need both.
	rm README.md
}
