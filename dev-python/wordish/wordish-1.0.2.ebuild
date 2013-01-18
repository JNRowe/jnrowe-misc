# Copyright © 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_{6,7})

inherit jnrowe-pypi

DESCRIPTION="Parses a shell session, test the commands compare the output"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# sphinx is required for documentation builds, but the current release is
# missing the necessary files for a rebuild.
DEPEND=""
RDEPEND="dev-python/docutils"

python_test() {
	nosetests || die
}
