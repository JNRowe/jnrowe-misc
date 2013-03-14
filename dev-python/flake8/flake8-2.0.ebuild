# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_{5..7},3_{1..3}})

inherit jnrowe-pypi

DESCRIPTION="Python code checking using mccabe, pep8 and pyflakes"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

# tests are not currently usable until Gentoo upstreams fixes dependencies
RESTRICT="test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/nose2 )"
# setuptools is required in RDEPEND for entry points usage
RDEPEND="${DEPEND}
	dev-python/mccabe[${PYTHON_USEDEP}]
	>=dev-python/pyflakes-0.6.1
	>=dev-python/pep8-1.4.3[${PYTHON_USEDEP}]"

DOCS=(CONTRIBUTORS.txt README.rst)

python_test() {
	nose2 flake8.tests || die
}
