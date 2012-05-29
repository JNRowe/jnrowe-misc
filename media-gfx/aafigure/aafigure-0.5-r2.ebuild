# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# 3.x is not supported because of exception syntax
PYTHON_COMPAT="python2_5 python2_6 python2_7"

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
DEPEND="doc? ( media-gfx/sphinxcontrib-aafig )
	${RDEPEND}"

python_prepare_all() {
	mv docutils/setup{-docutils-plugin,}.py
	# Workaround a option parsing bug in the current release
	sed -i '/^ \+:aspect\|scale:/d' documentation/*.rst
}

src_compile() {
	python-distutils-ng_src_compile

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
	_python-distutils-ng_default_distutils_install

	if use docutils; then
		cd docutils
		"${PYTHON}" setup.py install ${compile_flags} --root="${D}" \
			|| die "install in docutils failed"
		cd ../
	fi
}

python_install_all() {
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
