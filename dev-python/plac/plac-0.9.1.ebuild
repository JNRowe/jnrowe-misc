# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2"

inherit jnrowe-pypi

DESCRIPTION="The smartest command line arguments parser in the world"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples tk"

DEPEND="dev-python/setuptools"
RDEPEND="python_targets_python2_5? ( dev-python/multiprocessing )
	virtual/python-argparse
	python_targets_python2_7? ( dev-python/argparse )
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
