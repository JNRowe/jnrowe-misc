# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="*:2.5"
SUPPORT_PYTHON_ABIS="1"
# 2.4 is restricted due to use of generators
RESTRICT_PYTHON_ABIS="2.4"

inherit jnrowe-pypi

DESCRIPTION="The smartest command line arguments parser in the world"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND="dev-python/setuptools"
RDEPEND="|| ( dev-python/argparse >=dev-lang/python-2.7 )
	|| ( dev-python/multiprocessing >=dev-lang/python-2.6 )"

PYTHON_MODNAME="${PN}.py ${PN}_core.py ${PN}_ext.py"

src_install() {
	distutils_src_install

	dodoc doc/plac*.{pdf,txt}
	dohtml doc/*.html

	insinto /usr/share/doc/${PF}
	if use examples; then
		doins doc/*.{help,py}
	fi
}
