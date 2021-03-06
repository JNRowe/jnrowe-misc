# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="Painless Debugging and Inspection for Python"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND=""
RDEPEND="dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/decorator[${PYTHON_USEDEP}]"

DOCS=(HISTORY.rst ROADMAP.rst)

# Tests are useless in portage environment, if this changes write python_test
