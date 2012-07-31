# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Wrapper for the Universal Feed Parser which caches the results"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="doc? ( dev-python/sphinx )"
RDEPEND="dev-python/feedparser"

src_compile() {
	python-distutils-ng_src_compile

	if use doc; then
		# The tarball is missing files needed for a complete doc build, but
		# *some* docs are better than nothing.
		python ./setup.py build_sphinx || die "build_sphinx failed"
	fi
}

python_install_all() {
	if use doc; then
		dohtml -r build/sphinx/html/
	fi
}
