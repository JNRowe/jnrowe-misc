# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="*"
SUPPORT_PYTHON_ABIS="1"
DISTUTILS_SRC_TEST="nosetests"
DISTUTILS_USE_SEPARATE_SOURCE_DIRECTORIES="1"

inherit jnrowe-pypi

DESCRIPTION="Python Port of John Gruber's titlecase.pl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=""

src_prepare() {
	distutils_src_prepare

	prepare() {
		# Remove ez_setup automagic
		sed -i '/use_setuptools/d' "${WORKDIR}"/${P}-${PYTHON_ABI}/setup.py

		if [ "${PYTHON_ABI::1}" = 3 ]; then
			2to3 -w "${WORKDIR}"/${P}-${PYTHON_ABI}/${PN}/tests.py
		fi
	}
	python_execute_function prepare
}
