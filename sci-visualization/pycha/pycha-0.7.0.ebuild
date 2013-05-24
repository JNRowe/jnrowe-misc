# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# Python 2.5 isn't supported because of pycairo dep
# Python 3.x could be supported with a 2to3 run, if interest arrises
PYTHON_COMPAT=(python2_{6,7})

inherit jnrowe-pypi

DESCRIPTION="A library for making charts with Python"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/pycairo[${PYTHON_USEDEP}]
	dev-python/pygtk[${PYTHON_USEDEP}]"

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
