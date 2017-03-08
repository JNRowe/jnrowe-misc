# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# <2.7 is restricted until the blockdiag ebuild has support
# 3.x is not supported because of reportlab dependency
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
	>=dev-python/blockdiag-1.3.0[${PYTHON_USEDEP}]
	!minimal? ( dev-python/sphinx[${PYTHON_USEDEP}] )"

DOCS=(src/README.txt)

python_compile() {
	# Avoid distutils-r1's setup.cfg generation, as it surfaces an upstream
	# packaging bug.
	_distutils-r1_copy_egg_info

	esetup.py build "${@}"
}

src_install() {
	distutils-r1_src_install

	doman ${PN}.1 rackdiag.1

	insinto /usr/share/doc/${PF}
	if use examples ; then
		doins -r examples || die "doins failed"
	fi

	use minimal && optfeature "Sphinx support" dev-python/sphinx
}
