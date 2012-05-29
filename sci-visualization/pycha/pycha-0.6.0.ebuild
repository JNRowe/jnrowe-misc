# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# Python 2.5 and 3.x aren't supported because of pycairo dep
PYTHON_COMPAT="python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="A library for making charts with Python"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples test"

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/pycairo
	dev-python/pygtk"

DOCS=(CHANGES.txt)

python_test() {
	# How I wish we could just use nose...
	local file files=tests/*.py
	for file in ${files}; do
		PYTHONPATH=${PWD} "${PYTHON}" ${file} \
			|| die "${file} failed with ${PYTHON}"
	done
}

python_install_all() {
	insinto /usr/share/doc/${PF}
	if use examples; then
		doins -r examples
	fi
}
