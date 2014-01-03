# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_{6,7},3_{2,3}})

inherit distutils-r1

DESCRIPTION="Extensions for the nose testing framework"
HOMEPAGE="http://darcs.idyll.org/~t/projects/${PN}/doc/"
SRC_URI="http://darcs.idyll.org/~t/projects/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc examples test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/nose[${PYTHON_USEDEP}]"

# Tests fail to show usage
RESTRICT="test"

DOCS=(IDEAS)

python_install_all() {
	distutils-r1_python_install_all

	dodoc doc/ChangeLog doc/*.txt || die "dodoc failed"
	if use doc; then
		dohtml doc/index.html doc/default.css || die "dohtml failed"
	fi
	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples
	fi
}
