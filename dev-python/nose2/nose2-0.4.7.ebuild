# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

# ********
# * next * Bring back HTML doc support when upstream brings back conf.py
# ********

EAPI=5
PYTHON_COMPAT=(python{2_7,3_{3,4}})

inherit jnrowe-pypi

DESCRIPTION="The next generation of nicer testing for Python"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
# setuptools is required in RDEPEND for entry points
RDEPEND="${DEPEND}
	dev-python/six[${PYTHON_USEDEP}]"

PATCHES=(
	"${FILESDIR}"/${PN}-0.4-remote_version_specific_runners.patch
	"${FILESDIR}"/${P}-loosen_six_dependency.patch
)

DOCS=(AUTHORS README.rst)

python_install_all() {
	distutils-r1_python_install_all

	dodoc -r docs || die "dohtml failed"
}
