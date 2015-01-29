# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi

DESCRIPTION="Cucumber-ish BDD for python"
HOMEPAGE="http://${PN}.it/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# setuptools is required in RDEPEND for entry points
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}
	dev-python/fuzzywuzzy[${PYTHON_USEDEP}]"

DOCS=(README.md RELEASE-NOTES.md)
