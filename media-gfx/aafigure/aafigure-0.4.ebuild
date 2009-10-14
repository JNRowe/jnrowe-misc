# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit jnrowe-pypi

DESCRIPTION="ASCII art figures parsed and output as SVG, PNG, and more"
HOMEPAGE="https://launchpad.net/aafigure"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc docutils examples"

DEPEND="doc? ( media-gfx/sphinxcontrib-aafig )
	docutils? ( >=dev-python/docutils-0.5 dev-python/setuptools )"
# setuptools is needed in RDEPEND because it installs a setuptools-based plugin
# for docutils
RDEPEND="${DEPEND}"

src_prepare() {
	mv docutils/setup{-docutils-plugin,}.py
	# Workaround a option parsing bug in the current release
	sed -i '/^ \+:aspect\|scale:/d' documentation/*.rst
}

src_compile() {
	distutils_src_compile

	if use doc; then
		cd documentation
		make html
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
		local sphinxdocs extglob
		# Hoop jumping because most package managers don't enable extglob
		extglob=$(shopt -q extglob; echo $?)
		[ ${extglob} == 1 ] && shopt -s extglob
		sphinxdocs="documentation/!(index.rst)"
		dodoc ${sphinxdocs}
		[ ${extglob} == 1 ] && shopt -u extglob
		dohtml -A svg -r documentation/_build/html/*
	fi
	if use examples ; then
		doins -r examples
	fi
}
