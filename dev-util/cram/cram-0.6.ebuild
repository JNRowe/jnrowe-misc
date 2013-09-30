# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_{6,7},3_{2,3}})

inherit distutils-r1

DESCRIPTION="A simple testing framework for command line applications"
HOMEPAGE="https://bitheap.org/${PN}/"
SRC_URI="https://bitheap.org/cram/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE="examples vim-syntax"

DEPEND=""
RDEPEND="${DEPEND}
	vim-syntax? ( || ( app-editors/vim app-editors/gvim ) )"

	DOCS=(README.txt TODO.txt)

python_test() {
	"${EPYTHON}" setup.py test
}

python_install_all() {
	distutils-r1_python_install_all

	insinto /usr/share/doc/${PF}
	if use examples; then
		doins -r examples
	fi

	if use vim-syntax; then
		insinto /usr/share/vim/vimfiles/syntax
		doins contrib/${PN}.vim || die "doins syntax failed"
		insinto /usr/share/vim/vimfiles/ftdetect
		doins "${FILESDIR}"/cram.vim || die "doins ftdetect failed"
	fi
}
