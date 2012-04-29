# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2"

inherit jnrowe-pypi

DESCRIPTION="The smartest command line arguments parser in the world"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples tk"

DEPEND="dev-python/setuptools"
RDEPEND="|| ( dev-python/argparse >=dev-lang/python-2.7 )
	|| ( dev-python/multiprocessing >=dev-lang/python-2.6 )
	tk? ( dev-lang/python[tk] )"

DOCS=(CHANGES.txt README.txt)

python_install_all() {
	python-distutils-ng_redoscript "/usr/bin/${PN}_runner.py"

	dodoc doc/plac*.{pdf,txt}
	dohtml doc/*.html

	insinto /usr/share/doc/${PF}
	if use examples; then
		doins doc/*.{help,py}
	fi
}
