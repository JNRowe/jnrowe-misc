# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# <2.7 is restricted until the blockdiag ebuild has support
# 3.x is restricted due to print syntax
PYTHON_COMPAT=(python2_7)

inherit jnrowe-pypi readme.gentoo

DESCRIPTION="Generate sequence-diagram image files from spec-text files"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples minimal"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
# Setuptools is required at runtime for wrapper scripts
RDEPEND="${DEPEND}
	>=media-gfx/blockdiag-1.2.0[${PYTHON_USEDEP}]
	!minimal? (
		dev-python/docutils
		dev-python/sphinx
	)"

DOCS=(src/README.txt src/TODO.txt)

src_install() {
	distutils-r1_src_install

	doman ${PN}.1

	insinto /usr/share/doc/${PF}
	if use examples ; then
		doins -r examples || die "doins failed"
	fi

	use minimal && readme.gentoo_create_doc
}

pkg_postinst() {
	use minimal && readme.gentoo_print_elog
}
