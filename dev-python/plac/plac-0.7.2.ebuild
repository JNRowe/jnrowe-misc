# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="*"
SUPPORT_PYTHON_ABIS="1"

inherit jnrowe-pypi

DESCRIPTION="The smartest command line arguments parser in the world"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND="dev-python/setuptools"
RDEPEND="|| ( dev-python/argparse >=dev-lang/python-2.7 )
	|| ( dev-python/multiprocessing >=dev-lang/python-2.6 )"

src_install() {
	distutils_src_install

	dodoc doc/plac*.{pdf,txt} doc/emacs-integration.txt
	dohtml doc/*.html

	insinto /usr/share/doc/${PF}
	if use examples; then
		doins doc/*.{help,py}
	fi
}
