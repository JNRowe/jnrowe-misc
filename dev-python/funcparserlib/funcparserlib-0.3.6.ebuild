# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_{5..7},3_{1..3}})

inherit jnrowe-pypi

DESCRIPTION="Recursive descent parsing library based on functional combinators"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

# Tests are broken with Python 3, and with some versions of Python 2 because of
# float repr usage
RESTRICT="test"

DOCS=(CHANGES doc/Brackets.md doc/FAQ.md doc/Illustrated.md doc/Tutorial.md)

python_test() {
	${EPYTHON} -m unittest discover ${PN}.tests \
		|| die "Tests failed with ${EPYTHON}"
}
