# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_{5..7},3_{1..3}})
MY_PN="${PN/-/.}"
MY_PV="${PV/_p/-post-}"

inherit jnrowe-pypi versionator

DESCRIPTION="Simple Python plugin loader inspired by twisted.plugin"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="virtual/python-importlib[${PYTHON_USEDEP}]"