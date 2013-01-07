# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# Python 2.5 and 3.x aren't supported because of pycairo dep
PYTHON_COMPAT=(python2_{6,7})

inherit jnrowe-pypi

DESCRIPTION="A library for making charts with Python"

LICENSE="LGPL-3+"
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
		"${EPYTHON}" ${file} \
			|| die "${file} failed with ${PYTHON}"
	done
}

python_install_all() {
	distutils-r1_python_install_all

	insinto /usr/share/doc/${PF}
	if use examples; then
		doins -r examples
	fi
}
