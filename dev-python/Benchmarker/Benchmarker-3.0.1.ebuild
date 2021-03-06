# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_7,3_4})

inherit jnrowe-pypi

DESCRIPTION="A small utility to benchmark your Python code"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND=""
RDEPEND="${DEPEND}"

DOCS=(CHANGES.txt)

python_test() {
	PYTHONPATH="${S}" "${PYTHON}" test/benchmarker_test.py \
		|| die "benchmarker_test failed"
}

python_install_all() {
	distutils-r1_python_install_all

	insinto /usr/share/doc/${PF}
	if use examples; then
		doins -r examples
	fi
}
