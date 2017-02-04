# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_7,3_4})

inherit jnrowe-pypi

DESCRIPTION="The smartest command line arguments parser in the world"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples tk"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="tk? ( dev-lang/python[tk] )"

DOCS=(CHANGES.txt README.txt)

python_install_all() {
	distutils-r1_python_install_all

	dodoc doc/plac*.{pdf,txt}
	dohtml doc/*.html

	insinto /usr/share/doc/${PF}
	if use examples; then
		doins doc/*.{help,py}
	fi
}
