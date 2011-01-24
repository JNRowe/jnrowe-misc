# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted due to print and exception syntax
RESTRICT_PYTHON_ABIS="3.*"

inherit jnrowe-pypi

DESCRIPTION="Extensions for virtualenv"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for plugin functionality.
RDEPEND="${DEPEND}
	dev-python/virtualenv"

# Testsuite is quite faulty, restrict it until it is fixed
RESTRICT="test"

src_install() {
	distutils_src_install

	for lang in en es; do
		docinto ${lang}
		dodoc docs/${lang}/*
		docinto html/${lang}
		dohtml -r docs/html/${lang}/
	done
}
