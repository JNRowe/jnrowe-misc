# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

# 2.5 is restricted due to exception syntax and wildcard relative imports
PYTHON_COMPAT="python2_6 python2_7 python3_1 python3_2"

inherit jnrowe-pypi

DESCRIPTION="A simple argparse wrapper for an easier life"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/six
	python_targets_python2_6? ( dev-python/argparse )"

PATCHES=("${FILESDIR}"/${P}-Use_system_six.patch)

src_prepare() {
	rm ${PN}/six.py

	jnrowe-pypi_src_prepare
}
