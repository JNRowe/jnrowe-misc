# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.6"
# Python 2.{4,5} and 3.x aren't supported because of pycairo dep
RESTRICT_PYTHON_ABIS="2.[45] 3.*"

inherit jnrowe-pypi

DESCRIPTION="A library for making charts with Python"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/pycairo
	dev-python/pygtk"

DOCS="CHANGES.txt"

src_test() {
	# How I wish we could just use nose...
	local files=tests/*.py
	testing() {
		local file
		for file in ${files}; do
			PYTHONPATH=$PWD "$(PYTHON)" ${file} || die "${file} failed"
		done
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	insinto /usr/share/doc/${PF}
	if use examples; then
		doins -r examples
	fi
}
