# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# 3.x is restricted due to exception syntax
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="An enhanced drop-in replacement for pdb"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND="dev-python/setuptools
	test? ( dev-python/py )"
RDEPEND="dev-python/fancycompleter
	dev-python/wmctrl
	dev-python/pygments"

DOCS=(README)
