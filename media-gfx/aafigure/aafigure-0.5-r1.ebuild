# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="*"

inherit eutils jnrowe-pypi

DESCRIPTION="ASCII art figures parsed and output as SVG, PNG, and more"
HOMEPAGE="https://launchpad.net/aafigure"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc docutils examples pdf"

DEPEND="doc? ( media-gfx/sphinxcontrib-aafig )
	${RDEPEND}"
# setuptools is needed in RDEPEND because it installs a setuptools-based plugin
# for docutils
RDEPEND="dev-python/imaging
	docutils? ( >=dev-python/docutils-0.5 dev-python/setuptools )
	pdf? ( dev-python/reportlab )"

src_prepare() {
	mv docutils/setup{-docutils-plugin,}.py
	# Workaround a option parsing bug in the current release
	sed -i '/^ \+:aspect\|scale:/d' documentation/*.rst
}

src_compile() {
	distutils_src_compile

	if use doc; then
		cd documentation
		make html || die "make documentation failed"
		cd ..
	fi

	if use docutils; then
		cd docutils
		distutils_src_compile
		cd ..
	fi
}

src_install() {
	distutils_src_install

	if use docutils; then
		cd docutils
		distutils_src_install
		cd ../
	fi

	insinto /usr/share/doc/${PF}
	if use doc ; then
		local sphinxdocs
		eshopts_push -s extglob
		sphinxdocs="documentation/!(index.rst)"
		dodoc ${sphinxdocs} || die "dodoc ${sphinxdocs} failed"
		dohtml -A svg -r documentation/_build/html/* || die "dohtml failed"
		eshopts_pop
	fi
	if use examples ; then
		doins -r examples || die "doins failed"
	fi
}
