# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2"
MY_PN="${PN/-/.}"

inherit jnrowe-pypi

DESCRIPTION="Simple Python plugin loader inspired by twisted.plugin"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="python_targets_python2_5? ( dev-python/importlib )
	python_targets_python2_6? ( dev-python/importlib )"
