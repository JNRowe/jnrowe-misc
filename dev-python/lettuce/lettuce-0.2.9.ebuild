# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Cucumber-ish BDD for python"
HOMEPAGE="http://${PN}.it/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# setuptools is required in RDEPEND for entry points
DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}
	dev-python/fuzzywuzzy"

DOCS=(README.md RELEASE-NOTES.md)
