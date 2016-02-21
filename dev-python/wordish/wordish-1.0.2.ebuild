# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="Parses a shell session, test the commands compare the output"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

# sphinx is required for documentation builds, but the current release is
# missing the necessary files for a rebuild.
DEPEND="test? ( dev-python/nose[${PYTHON_USEDEP}] )"
RDEPEND="dev-python/docutils[${PYTHON_USEDEP}]"

python_test() {
	nosetests || die
}
