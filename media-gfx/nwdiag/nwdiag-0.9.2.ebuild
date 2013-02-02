# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# <2.7 is restricted until the blockdiag ebuild has support
# 3.x is restricted due to print syntax
PYTHON_COMPAT=(python2_7)

inherit eutils jnrowe-pypi

DESCRIPTION="Generate network-diagram images from spec-text file"

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

python_install_all() {
	distutils-r1_python_install_all

	doman ${PN}.1 rackdiag.1
	insinto /usr/share/doc/${PF}
	if use examples ; then
		doins -r examples || die "doins failed"
	fi
}

pkg_postinst() {
	if use minimal && ! has_version dev-python/sphinx; then
		einfo "${PN} installs a sphinx plugin, to make use of it you must"
		einfo "install sphinx."
	fi
}
