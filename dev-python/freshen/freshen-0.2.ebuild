# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"

inherit jnrowe-pypi eutils

DESCRIPTION="Clone of the Cucumber BDD framework for Python"
HOMEPAGE="http://github.com/rlisagor/freshen"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/nose
	dev-python/pyparsing
	dev-python/pyyaml"

DOCS="cuke-comparison.txt todo.txt"

RESTRICT_PYTHON_ABIS="2.4 3.*"

src_install() {
	distutils_src_install

	insinto /usr/share/doc/${PF}
	if use examples; then
		doins -r examples
	fi
}
