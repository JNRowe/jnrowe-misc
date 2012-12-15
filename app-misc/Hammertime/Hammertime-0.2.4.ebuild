# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# 2.5 isn't supported upstream, so we'll kill them here too
# 3.x is restricted due to print syntax
PYTHON_COMPAT=(python2_{6,7})

inherit jnrowe-pypi

DESCRIPTION="Simple time tracking with git backend"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
# setuptools needed in RDEPEND for wrapper scripts
RDEPEND="${DEPEND}
	>=dev-python/git-python-0.3.0"
