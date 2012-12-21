# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=(python{2_{5..7},3_{1..3}})

inherit jnrowe-pypi

DESCRIPTION="The smartest command line arguments parser in the world"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples tk"

DEPEND="dev-python/setuptools"
RDEPEND="python_targets_python2_5? ( dev-python/multiprocessing )
	virtual/python-argparse[${PYTHON_USEDEP}]
	tk? ( dev-lang/python[tk] )"

DOCS=(CHANGES.txt README.txt)

python_install_all() {
	dodoc doc/plac*.{pdf,txt}
	dohtml doc/*.html

	insinto /usr/share/doc/${PF}
	if use examples; then
		doins doc/*.{help,py}
	fi
}
