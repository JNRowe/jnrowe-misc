# Copyright © 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# 3.x is not supported because of exception syntax
PYTHON_COMPAT=(python2_{5..7})

inherit eutils jnrowe-pypi

DESCRIPTION="ASCII art figures parsed and output as SVG, PNG, and more"
HOMEPAGE="https://launchpad.net/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc docutils examples pdf"

# setuptools is needed in RDEPEND because it installs a setuptools-based plugin
# for docutils
RDEPEND="dev-python/imaging
	docutils? ( >=dev-python/docutils-0.5 dev-python/setuptools )
	pdf? ( dev-python/reportlab )"
RDEPEND="${RDEPEND}
	doc? ( media-gfx/sphinxcontrib-aafig[${PYTHON_USEDEP}] )"

PATCHES=("${FILESDIR}"/${P}-build_fixes.patch)

DOCS=(CHANGES.txt README.txt)

python_prepare_all() {
	mv docutils/setup{-docutils-plugin,}.py

	distutils-r1_python_prepare_all
}

python_compile_all() {
	if use doc; then
		cd documentation
		make html || die "make documentation failed"
		cd ..
	fi

	if use docutils; then
		cd docutils
		${PYTHON} ./setup.py build || die "build in docutils failed"
		cd ..
	fi
}

python_install() {
	distutils-r1_python_install

	if use docutils; then
		cd docutils
		distutils-r1_python_install
		cd ../
	fi
}

python_install_all() {
	distutils-r1_python_install_all

	insinto /usr/share/doc/${PF}
	if use doc ; then
		dodoc documentation/*.rst || die "dodoc *.rst failed"
		rm "${D}"/usr/share/doc/${PF}/index.rst
		dohtml -A svg -r documentation/_build/html/* || die "dohtml failed"
	fi
	if use examples ; then
		doins -r examples || die "doins failed"
	fi
}
