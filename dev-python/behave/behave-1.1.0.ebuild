# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"

inherit jnrowe-pypi

DESCRIPTION="Behaviour-driven development, Python style"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/parse
	|| ( >=dev-lang/python-2.7 dev-python/argparse )
	|| ( >=dev-lang/python-2.6 dev-python/simplejson )"

# Tests are unusable within portage environment
RESTRICT="test"
